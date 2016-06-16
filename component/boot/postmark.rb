require "postmark"

Berg::Container.register "postmark", Postmark::ApiClient.new(Berg::Container.settings.postmark_api_key)
