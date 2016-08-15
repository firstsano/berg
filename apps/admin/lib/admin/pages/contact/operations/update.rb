require "admin/import"
require "berg/matcher"
require "types"

module Admin
  module Pages
    module Contact
      module Operations
        class Update
          include Admin::Import[repo: "persistence.repositories.office_contact_details"]

          include Berg::Matcher

          def call(attributes)
            validation = Validation::Form.(attributes)

            if validation.success?
              contact_details = repo.update(validation.to_h)
              Dry::Monads::Right(contact_details)
            else
              Dry::Monads::Left(validation)
            end
          end
        end
      end
    end
  end
end
