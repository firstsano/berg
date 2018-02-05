module Main
  class Container < Dry::Web::Container
    require_from_root "system/berg/container"

    import core: Berg::Container

    configure do |config|
      config.root = Pathname(__FILE__).join("../..").realpath.dirname.freeze

      config.default_namespace = "main"

      config.auto_register = %w[
        lib/main/operations
        lib/main/persistence
        lib/main/validation
        lib/main/views
      ]

      config.logger = Berg::Container[:logger]
    end

    load_paths! "lib", "system"
  end
end
