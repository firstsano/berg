require "types"
require "main/entities/post"

module Main
  module Entities
    class Category < Dry::Struct
      attribute :id, Types::Strict::Int
      attribute :name, Types::Strict::String
      attribute :slug, Types::Strict::String
    end
  end
end
