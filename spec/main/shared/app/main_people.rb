RSpec.shared_context "main people" do
  def create_person(name, email, bio)
    Berg::Container["persistence.commands.create_person"].(
      name: name,
      email: email,
      bio: bio,
      short_bio: bio,
      active: true,
      city: "Melbourne",
    )
  end
end
