require "types"

module Main
  module Entities
    class User < Dry::Struct
      attribute :id, Types::Strict::Int
      attribute :name, Types::Strict::String
      attribute :email, Types::Strict::String
    end
  end
end
