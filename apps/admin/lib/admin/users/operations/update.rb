require "admin/import"
require "admin/entities/user"
require "admin/users/validation/form"
require "berg/matcher"

module Admin
  module Users
    module Operations
      class Update
        include Admin::Import["persistence.repositories.users"]

        include Berg::Matcher

        def call(id, attributes)
          validation = Validation::Form.(prepare_attributes(attributes))
          if validation.success?
            users.update(id, validation.output)
            Dry::Monads::Right(users[id])
          else
            Dry::Monads::Left(validation)
          end
        end

        private

        def prepare_attributes(attributes)
          attributes.merge(
            previous_email: attributes["email"]
          )
        end
      end
    end
  end
end
