require "types"

module Admin
  module Entities
    class Asset < Dry::Types::Value
      attribute :path, Types::Strict::String
      attribute :content_type, Types::Strict::String
      attribute :geometry, Types::Strict::String
      attribute :bytes, Types::Strict::String
    end
  end
end
