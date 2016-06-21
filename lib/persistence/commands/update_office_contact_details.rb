module Persistence
  module Commands
    class UpdateOfficeContactDetails < ROM::Commands::Update[:sql]
      relation :office_contact_details
      register_as :update
      result :many

      def execute(tuple)
        if tuple[:office_locations]
          relation.delete

          office_contact_details_tuples = tuple[:office_locations].map.with_index do |location_details, position|
            {
              position: position,
              name: location_details[:name],
              phone_number: location_details[:phone_number],
              address: location_details[:address],
              latitude: location_details[:latitude],
              longitude: location_details[:longitude]
            }
          end

          relation.multi_insert(office_contact_details_tuples)
        end
      end
    end
  end
end
