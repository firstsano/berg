require "bugsnag"

module Umbrella
  class Application < Roda
    use Bugsnag::Rack

    plugin :static, ["/assets", "/robots.txt", "/favicon.ico", "/apple-touch-icon.png"], header_rules: [
      [:all, {"Cache-Control" => "public, max-age=86400"}],
      ["/assets", {"Cache-Control" => "public, max-age=31536000"}]
    ]
    plugin :error_handler

    route do |r|
      r.on "admin" do
        r.run Admin::Application.freeze.app
      end

      r.run Main::Application.freeze.app
    end

    error do |e|
      Bugsnag.auto_notify e
      raise e
    end
  end
end
