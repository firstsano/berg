require "admin/import"
require "admin/entities/user"
require "admin/users/validation/password_form"
require "berg/matcher"

module Admin
  module Users
    module Operations
      class ChangePassword
        include Admin::Import[
          "persistence.repositories.users",
          "core.authentication.encrypt_password",
        ]

        include Berg::Matcher

        def call(id, attributes)
          validation = Validation::PasswordForm.(attributes)

          if validation.success?
            result = users.update(id, prepare_attributes(validation.output))
            Dry::Monads::Right(result)
          else
            Dry::Monads::Left(validation)
          end
        end

        private

        def prepare_attributes(attributes)
          {encrypted_password: encrypt_password.(attributes[:password])}
        end
      end
    end
  end
end
