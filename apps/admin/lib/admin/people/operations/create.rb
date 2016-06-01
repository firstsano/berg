require "admin/import"
require "admin/entities/person"
require "admin/people/validation/form"
require "dry-result_matcher"
require "kleisli"
require "types"

module Admin
  module People
    module Operations
      class Create
        include Admin::Import(
          "admin.persistence.repositories.people",
        )

        include Dry::ResultMatcher.for(:call)

        def call(attributes)
          validation = Validation::Form.(attributes)

          if validation.success?
            person = Entities::Person.new(people.create(prepare_attributes(validation.output)))
            Right(person)
          else
            Left(validation)
          end
        end

        private

        def prepare_attributes(attributes)
          attributes.merge(
            avatar_image: attributes[:avatar_image].to_json
          )
        end
      end
    end
  end
end
