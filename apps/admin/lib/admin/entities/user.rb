require "types"

module Admin
  module Entities
    class User < Dry::Types::Value
      attribute :id, Types::Strict::Int
      attribute :name, Types::Strict::String
      attribute :email, Types::Strict::String
      attribute :encrypted_password, Types::Nil | Types::Strict::String
      attribute :access_token, Types::Strict::String
      attribute :access_token_expiration, Types::Strict::Time
      attribute :active, Types::Strict::Bool

      alias_method :active?, :active
    end
  end
end
