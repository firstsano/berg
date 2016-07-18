module Main
  class Container < Dry::Web::Container
    require root.join("component/berg/container")
    import Berg::Container

    configure do |config|
      config.root = Pathname(__FILE__).join("../..").realpath.dirname.freeze

      config.auto_register = %w[
        lib/main/operations
        lib/main/persistence
        lib/main/validation
        lib/main/views
      ]
    end

    load_paths! "lib", "component"
  end
end
