require "umbrella/repository"
require "admin/entities/office_contact_detail"

module Admin
  module Persistence
    module Repositories
      class OfficeContactDetails < Umbrella::Repository[:office_contact_details]
        def update(attrs)
          command(:office_contact_details)[:update].(attrs)
        end

        def listing_by_position
          office_contact_details
            .by_position
            .as(Entities::OfficeContactDetail)
        end
      end
    end
  end
end
