require "admin/import"
require "berg/matcher"

module Admin
  module Authentication
    class Authorize
      include Admin::Import[
        "core.authentication.encrypt_password",
        "persistence.repositories.users",
      ]

      include Berg::Matcher

      def call(session)
        id = session[:user_id]
        user = id && users[id]

        if user && user.active?
          Dry::Monads::Right(user)
        else
          Dry::Monads::Left(:unauthorized)
        end
      end
    end
  end
end
