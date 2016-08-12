require "dry/monads"
require "dry/matcher"
require "dry/matcher/either_matcher"

module Authentication
  class Authenticate
    include Dry::Matcher.for(:call, with: Dry::Matcher::EitherMatcher)

    def call(attributes)
      email, password = attributes.values_at("email", "password")
      entity = fetch(email)

      if entity && encrypt_password.same?(entity.encrypted_password, password)
        Dry::Monads::Right(entity)
      else
        Dry::Monads::Left(:user_not_found)
      end
    end

    def fetch(_email)
      raise NotImplementedError
    end
  end
end
