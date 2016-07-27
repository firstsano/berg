require "admin/import"
require "kleisli"
require "dry-result_matcher"
require "types"

module Admin
  module Pages
    module About
      module Operations
        class Update
          include Admin::Import(
            repo: "admin.persistence.repositories.about_page_people"
          )

          include Dry::ResultMatcher.for(:call)

          def call(attributes)
            validation = Validation::Form.(attributes)

            if validation.success?
              about_page_people = repo.update(validation.to_h)
              Right(about_page_people)
            else
              Left(validation)
            end
          end
        end
      end
    end
  end
end
