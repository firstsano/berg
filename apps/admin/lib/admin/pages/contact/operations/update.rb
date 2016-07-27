require "admin/import"
require "dry-result_matcher"
require "kleisli"
require "types"

module Admin
  module Pages
    module Contact
      module Operations
        class Update
          include Admin::Import(
            repo: "admin.persistence.repositories.office_contact_details"
          )

          include Dry::ResultMatcher.for(:call)

          def call(attributes)
            validation = Validation::Form.(attributes)
            
            if validation.success?
              contact_details = repo.update(validation.to_h)
              Right(contact_details)
            else
              Left(validation)
            end
          end
        end
      end
    end
  end
end
