require "admin/import"
require "securerandom"
require "openssl"

module Admin
  module Uploads
    module Operations
      class Presign
        def call
          uuid = SecureRandom.uuid
          expiration = (Time.now + 60 * 60 * 3).to_i

          payload = {
            url: "#{attache_host}/upload",
            uuid: uuid,
            expiration: expiration,
            hmac: OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new("sha1"), attache_secret_key, "#{uuid}#{expiration}"),
          }

          payload
        end

        private

        def attache_host
          Berg::Container.settings.attache_uploads_base_url
        end

        def attache_secret_key
          Berg::Container.settings.attache_secret_key
        end
      end
    end
  end
end
