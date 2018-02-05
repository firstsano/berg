require "berg/repository"
require "admin/entities"

module Admin
  module Persistence
    module Repositories
      class OfficeContactDetails < Berg::Repository[:office_contact_details]
        struct_namespace Admin::Entities

        def update(attrs)
          command(:office_contact_details)[:update].(attrs)
        end

        def listing_by_position
          office_contact_details.by_position
        end
      end
    end
  end
end
