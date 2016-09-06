require "securerandom"

module Admin
  module Users
    class AccessToken
      def value
        SecureRandom.hex
      end

      def expires_at
        Time.now + (2*24*60*60)
      end
    end
  end
end
