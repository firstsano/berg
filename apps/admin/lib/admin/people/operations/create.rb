require "admin/import"
require "admin/entities/person"
require "admin/people/validation/form"
require "berg/matcher"
require "types"

module Admin
  module People
    module Operations
      class Create
        include Admin::Import["persistence.repositories.people"]

        include Berg::Matcher

        def call(attributes)
          validation = Validation::Form.(attributes)

          if validation.success?
            person = Entities::Person.new(people.create(validation.output))
            Dry::Monads::Right(person)
          else
            Dry::Monads::Left(validation)
          end
        end
      end
    end
  end
end
