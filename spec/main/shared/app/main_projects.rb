require "babosa"

RSpec.shared_context "main_projects" do
  def create_project(title, status="published")
    Berg::Container["persistence.commands.create_project"].({
      title: title,
      client: "foo corp",
      url: "http://foo.com",
      intro: "the intro",
      summary: "the summary",
      body: "the body",
      tags: "tag",
      slug: title.to_slug.normalize.to_s,
      status: status,
      published_at: Time.now,
      color: "blue",
    })
  end
end
