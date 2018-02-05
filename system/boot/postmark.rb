Berg::Container.boot(:postmark) do |berg|
  init do
    require "postmark"
  end

  start do
    register :postmark, Postmark::ApiClient.new(berg.settings.postmark_api_key)
  end
end
