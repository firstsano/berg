RSpec.shared_context "admin people" do
  def create_person(name, email, bio, attrs = {})
    Admin::Container["admin.people.operations.create"].({
      "name" => name,
      "email" => email,
      "bio" => bio,
      "short_bio" => bio,
      "active" => true,
      "avatar" => {},
      "twitter" => "",
      "website" => "",
      "job_title" => "Developer"
    }.merge(attrs)).value
  end

  let!(:sample_person) { create_person("Jane Doe", "person@example.com", "bio") }
end
