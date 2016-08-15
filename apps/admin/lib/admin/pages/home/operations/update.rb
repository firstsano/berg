require "admin/import"
require "berg/matcher"

module Admin
  module Pages
    module Home
      module Operations
        class Update
          include Admin::Import(
            repo: "persistence.repositories.home_page_featured_items"
          )

          include Berg::Matcher

          def call(attributes)
            validation = Validation::Form.(attributes)

            if validation.success?
              home_page_featured_items = repo.update(validation.to_h)
              Dry::Monads::Right(home_page_featured_items)
            else
              Dry::Monads::Left(validation)
            end
          end
        end
      end
    end
  end
end
