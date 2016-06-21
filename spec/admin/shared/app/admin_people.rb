RSpec.shared_context "admin people" do
  def create_person(name, bio, attrs = {})
    Admin::Container["admin.people.operations.create"].({
      "name" => name,
      "bio" => bio,
      "short_bio" => bio,
      "active" => true,
      "avatar_image" => {},
      "twitter_handle" => "",
      "website_url" => "",
      "job_title" => "Developer",
      "city" => "Melbourne"
    }.merge(attrs)).value
  end

  let!(:sample_person) { create_person("Jane", "bio") }
end
