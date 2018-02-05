require "berg/repository"
require "main/entities"

module Main
  module Persistence
    module Repositories
      class OfficeContactDetails < Berg::Repository[:office_contact_details]
        struct_namespace Main::Entities

        def for_contact_page
          office_contact_details.by_position
        end
      end
    end
  end
end
