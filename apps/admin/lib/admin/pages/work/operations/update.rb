require "admin/import"
require "dry-result_matcher"
require "kleisli"

module Admin
  module Pages
    module Work
      module Operations
        class Update
          include Admin::Import(
            repo: "admin.persistence.repositories.work_page_featured_items"
          )

          include Dry::ResultMatcher.for(:call)

          def call(attributes)
            validation = Validation::Form.(attributes)

            if validation.success?
              Right(repo.update(validation.to_h))
            else
              Left(validation)
            end
          end
        end
      end
    end
  end
end
