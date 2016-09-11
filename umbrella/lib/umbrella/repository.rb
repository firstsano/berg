require "rom-repository"
require "umbrella/container"
require "umbrella/import"

# TODO: determine if this is still needed with dry-system
Umbrella::Container.boot! :rom

module Umbrella
  class Repository < ROM::Repository::Root
    include Umbrella::Import.args["persistence.rom"]
  end
end
