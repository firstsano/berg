require "types"

module Main
  module Entities
    class Person < Dry::Types::Value
      attribute :id, Types::Strict::Int
      attribute :name, Types::Strict::String
      attribute :email, Types::Strict::String
      attribute :bio, Types::Strict::String
      attribute :avatar, Types::Form::Hash
      attribute :job_title, Types::Strict::String.optional
      attribute :twitter, Types::Strict::String.optional
      attribute :website, Types::Strict::String.optional
    end
  end
end
