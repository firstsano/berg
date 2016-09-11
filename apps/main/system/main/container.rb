module Main
  class Container < Dry::Web::Container
    require root.join("umbrella/system/umbrella/container")
    import Umbrella::Container

    configure do |config|
      config.root = Pathname(__FILE__).join("../..").realpath.dirname.freeze

      config.default_namespace = "main"

      config.auto_register = %w[
        lib/main/operations
        lib/main/persistence
        lib/main/validation
        lib/main/views
      ]
    end

    load_paths! "lib", "system"
  end
end
