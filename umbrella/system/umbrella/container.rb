top_lib_dir = Pathname(__dir__).join("../../../lib").realpath.freeze
$LOAD_PATH.unshift(top_lib_dir) unless $LOAD_PATH.include?(top_lib_dir)

require "dry/web/container"

module Umbrella
  class Container < Dry::Web::Container
    configure do |config|
      config.root = Pathname(__FILE__).join("../..").realpath.dirname.freeze

      config.name = :core

      config.default_namespace = "umbrella"

      config.auto_register = %w[lib]
    end

    load_paths! "lib", "system"
  end
end
