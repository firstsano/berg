RSpec.shared_context "main posts" do
  def create_user(name: "Jane")
    Umbrella::Container["persistence.commands.create_user"].(
      name: name,
      email: "#{name}#{Random.new.rand(100)}@example.org",
      active: true,
      access_token: "123456",
      access_token_expiration: Time.now,
    )
  end

  def create_post(title, teaser, slug, person, status = "published")
    Umbrella::Container["persistence.commands.create_post"].(
      title: title,
      body: "test",
      teaser: teaser,
      slug: slug,
      person_id: person[:id],
      status: status,
      published_at: Time.now,
      color: "blue",
    )
  end
end
