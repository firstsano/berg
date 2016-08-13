Berg::Container.finalize(:postmark) do |container|
  uses :config

  require "postmark"

  Berg::Container.register "postmark", Postmark::ApiClient.new(config.postmark_api_key)
end
