require "dry/web/settings"
require "dry-types"

module Berg
  class Settings < Dry::Web::Settings
    module Types
      include Dry::Types.module

      module Required
        String = Types::Strict::String.constrained(min_size: 1)
      end
    end

    setting :admin_url, Types::Required::String
    setting :admin_mailer_from_email, Types::Required::String

    setting :database_url, Types::Required::String
    setting :session_secret, Types::Required::String

    setting :canonical_domain
    setting :assets_server_url
    setting :precompiled_assets, Types::Form::Bool.default(false)
    setting :precompiled_assets_host

    setting :app_mailer_from_email

    setting :bugsnag_api_key
    setting :postmark_api_key

    setting :basic_auth_user
    setting :basic_auth_password

    setting :attache_uploads_base_url
    setting :attache_downloads_base_url
    setting :attache_secret_key

    setting :aws_access_key_id
    setting :aws_secret_access_key
    setting :aws_bucket
    setting :aws_region
  end
end
