require "types"

module Admin
  module Entities
    class OfficeContactDetail < Dry::Types::Struct
      attribute :id, Types::Strict::Int
      attribute :name, Types::Strict::String
      attribute :address, Types::Strict::String
      attribute :phone_number, Types::Strict::String
    end
  end
end
