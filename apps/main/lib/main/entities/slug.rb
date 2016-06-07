require "types"

module Main
  module Entities
    class Slug < Dry::Types::Struct
      attribute :slug, "string"
    end
  end
end
