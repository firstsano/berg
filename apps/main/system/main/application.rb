require "bugsnag"
require "rack/csrf"
require "dry-web-roda"
require_relative "container"
require "roda_plugins"

module Main
  class Application < Dry::Web::Roda::Application
    configure do |config|
      config.routes = "web/routes".freeze
      config.container = Container
    end

    opts[:root] = Pathname(__FILE__).join("../..").realpath.dirname

    use Rack::Session::Cookie, key: "berg.session", secret: Umbrella::Container["config"].session_secret
    use Rack::Csrf, raise: true
    use Bugsnag::Rack

    if Umbrella::Container["config"].basic_auth_user && Umbrella::Container["config"].basic_auth_password
      use Rack::Auth::Basic do |username, password|
        username == Umbrella::Container["config"].basic_auth_user && password == Umbrella::Container["config"].basic_auth_password
      end
    end

    plugin :error_handler
    plugin :flash
    plugin :not_found
    plugin :page
    plugin :view

    route do |r|
      r.root do
        r.view "pages.home"
      end

      r.multi_route
    end

    not_found do
      self.class["views.errors.error_404"].(scope: current_page)
    end

    error do |e|
      if ENV["RACK_ENV"] != "development"
        if e.is_a?(ROM::TupleCountMismatchError)
          response.status = 404
          self.class["views.errors.error_404"].(scope: current_page)
        else
          Bugsnag.auto_notify e
          self.class["views.errors.error_500"].(scope: current_page)
        end
      else
        Bugsnag.auto_notify e
        raise e
      end
    end

    load_routes!
  end
end
