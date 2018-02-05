module Admin
  class Container < Dry::Web::Container
    require_from_root "system/berg/container"

    import core: Berg::Container

    configure do |config|
      config.name = :admin
      config.default_namespace = "admin"

      config.root = Pathname(__FILE__).join("../..").realpath.dirname.freeze

      config.auto_register = %w[lib/admin]

      config.logger = Berg::Container[:logger]
    end

    load_paths! "lib", "system"
  end
end
