require "admin/import"
require "admin/people/validation/form"
require "dry-result_matcher"
require "kleisli"

module Admin
  module People
    module Operations
      class Update
        include Admin::Import(
          "admin.persistence.repositories.people"
        )

        include Dry::ResultMatcher.for(:call)

        def call(id, attributes)
          validation = Validation::Form.(prepare_attributes(attributes))
          if validation.success?
            people.update(id, validation.to_h)
            Right(people[id])
          else
            Left(validation)
          end
        end

        private

        def prepare_attributes(attributes)
          attributes.merge(
            previous_email: attributes["email"],
            avatar_image: attributes["avatar_image"]
          )
        end
      end
    end
  end
end
