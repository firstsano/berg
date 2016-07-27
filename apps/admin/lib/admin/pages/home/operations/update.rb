require "admin/import"
require "dry-result_matcher"
require "kleisli"

module Admin
  module Pages
    module Home
      module Operations
        class Update
          include Admin::Import(
            repo: "admin.persistence.repositories.home_page_featured_items"
          )

          include Dry::ResultMatcher.for(:call)

          def call(attributes)
            validation = Validation::Form.(attributes)

            if validation.success?
              home_page_featured_items = repo.update(validation.to_h)
              Right(home_page_featured_items)
            else
              Left(validation)
            end
          end
        end
      end
    end
  end
end
