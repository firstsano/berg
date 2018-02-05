require "dry/system/components"
require "dry/web/container"

module Berg
  class Container < Dry::Web::Container
    configure do |config|
      config.name = :core
      config.auto_register = %w[lib/authentication]
      config.listeners = true
    end

    load_paths! "lib", "system"

    def self.settings
      self[:settings]
    end
  end
end
