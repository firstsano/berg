module Persistence
  module Relations
    class OfficeContactDetails < ROM::Relation[:sql]
      schema(:office_contact_details) do
        attribute :id, Types::Serial
        attribute :position, Types::Strict::Int
        attribute :name, Types::Strict::String
        attribute :address, Types::Strict::String
        attribute :phone_number, Types::Strict::String
        attribute :latitude, Types::Strict::String
        attribute :longitude, Types::Strict::String
      end

      def by_position
        order(:position)
      end
    end
  end
end
