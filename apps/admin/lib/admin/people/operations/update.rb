require "admin/import"
require "admin/people/validation/form"
require "berg/matcher"

module Admin
  module People
    module Operations
      class Update
        include Admin::Import("persistence.repositories.people")

        include Berg::Matcher

        def call(id, attributes)
          validation = Validation::Form.(prepare_attributes(attributes))
          if validation.success?
            people.update_by_id(id, validation.to_h)
            Dry::Monads::Right(people[id])
          else
            Dry::Monads::Left(validation)
          end
        end

        private

        def prepare_attributes(attributes)
          attributes.merge(
            avatar_image: attributes["avatar_image"]
          )
        end
      end
    end
  end
end
