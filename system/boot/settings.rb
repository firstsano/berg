Berg::Container.boot(:settings, from: :system) do
  before(:init) do
    require "types"
  end

  settings do
    RequiredString = Types::Strict::String.constrained(min_size: 1)

    key :admin_url, RequiredString
    key :admin_mailer_from_email, RequiredString

    key :database_url, RequiredString
    key :session_secret, RequiredString

    key :canonical_domain, Types::String
    key :assets_server_link_url, Types::String
    key :assets_server_read_url, Types::String
    key :precompiled_assets, Types::Form::Bool
    key :precompiled_assets_host, Types::String

    key :app_mailer_from_email, Types::String

    key :bugsnag_api_key, Types::String
    key :postmark_api_key, Types::String

    key :basic_auth_user, Types::String
    key :basic_auth_password, Types::String

    key :attache_uploads_base_url, Types::String
    key :attache_downloads_base_url, Types::String
    key :attache_secret_key, Types::String

    key :aws_access_key_id, Types::String
    key :aws_secret_access_key, Types::String
    key :aws_bucket, Types::String
    key :aws_region, Types::String

    key :ga_tracking_id, Types::String
  end
end
