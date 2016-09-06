require "securerandom"

module Admin
  module Users
    class AccessToken
      def value
        SecureRandom.hex
      end

      def expires_at
        Time.now + 2.days
      end
    end
  end
end
