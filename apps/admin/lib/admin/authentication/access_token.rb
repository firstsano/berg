require "admin/import"
require "berg/matcher"

module Admin
  module Authentication
    class AccessToken
      include Admin::Import["persistence.repositories.users"]

      include Berg::Matcher

      def call(access_token)
        user = users.by_access_token(access_token)

        if user
          Dry::Monads::Right(user)
        else
          Dry::Monads::Left(:access_token_invalid)
        end
      end
    end
  end
end
