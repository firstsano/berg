require "dry/web/container"

module Berg
  class Container < Dry::Web::Container
    configure do |config|
      config.name = :core
      config.auto_register = %w[lib/authentication]
    end

    load_paths! "lib", "component"
  end
end
