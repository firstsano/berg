RSpec.shared_context 'main external_posts' do

  def create_external_post(title)
    Berg::Container["persistence.commands.create_external_post"].({
      title: title,
      website_url: "http://foo.bar",
      image_url: "http://foo.bar/image.png",
      image_upload: nil,
      status: "published",
      published_at: Time.now
    })
  end
end
