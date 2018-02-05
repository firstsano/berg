require "berg/repository"
require "main/entities/office_contact_detail"

module Main
  module Persistence
    module Repositories
      class OfficeContactDetails < Berg::Repository[:office_contact_details]
        def for_contact_page
          office_contact_details
            .by_position
            .as(Entities::OfficeContactDetail)
        end
      end
    end
  end
end
