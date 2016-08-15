require "admin/import"
require "berg/matcher"
require "types"

module Admin
  module Pages
    module About
      module Operations
        class Update
          include Admin::Import(
            repo: "persistence.repositories.about_page_people"
          )

          include Berg::Matcher

          def call(attributes)
            validation = Validation::Form.(attributes)

            if validation.success?
              about_page_people = repo.update(validation.to_h)
              Dry::Monads::Right(about_page_people)
            else
              Dry::Monads::Left(validation)
            end
          end
        end
      end
    end
  end
end
