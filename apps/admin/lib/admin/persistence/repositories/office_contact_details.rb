require "berg/repository"
require "admin/entities/office_contact_detail"

module Admin
  module Persistence
    module Repositories
      class OfficeContactDetails < Berg::Repository[:office_contact_details]
        relations :office_contact_details

        def listing_by_position
          office_contact_details
            .by_position
            .as(Entities::OfficeContactDetail)
        end
      end
    end
  end
end
