RSpec.shared_context "admin categories" do
  def create_category(name)
    Admin::Container["categories.operations.create"].({
      name: name
    }).value
  end
end
