require "admin/import"
require "admin/entities/user"
require "berg/matcher"

module Admin
  module Users
    module Operations
      class UpdateAccessToken
        include Admin::Import(
          "admin.persistence.repositories.users",
          "admin.users.access_token",
        )

        include Berg::Matcher

        def call(email)
          return Dry::Monads::Left(:email_not_found) unless users.by_email!(email)

          attributes = users.update_by_email(
            email,
            access_token: access_token.value,
            access_token_expiration: access_token.expires_at,
          )

          Dry::Monads::Right(Entities::User.new(attributes))
        end
      end
    end
  end
end
