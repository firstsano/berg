require "types"

module Main
  module Entities
    class Person < Dry::Types::Value
      attribute :id, Types::Strict::Int
      attribute :name, Types::Strict::String
      attribute :email, Types::Strict::String
      attribute :bio, Types::Strict::String
      attribute :avatar, Types::Maybe::Strict::String
      attribute :job_title, Types::Maybe::Strict::String
      attribute :twitter, Types::Maybe::Strict::String
      attribute :website, Types::Maybe::Strict::String
    end
  end
end
