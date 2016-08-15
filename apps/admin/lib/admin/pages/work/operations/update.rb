require "admin/import"
require "berg/matcher"

module Admin
  module Pages
    module Work
      module Operations
        class Update
          include Admin::Import(
            repo: "persistence.repositories.work_page_featured_items"
          )

          include Berg::Matcher

          def call(attributes)
            validation = Validation::Form.(attributes)

            if validation.success?
              Dry::Monads::Right(repo.update(validation.to_h))
            else
              Dry::Monads::Left(validation)
            end
          end
        end
      end
    end
  end
end
