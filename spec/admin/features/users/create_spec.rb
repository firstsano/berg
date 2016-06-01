require "admin_app_helper"

RSpec.feature "Admin / Users / Create", js: true do
  include_context "admin users"

  background do
    sign_in(jane.email, jane.password)
  end

  scenario "I can create a user" do
    find("nav a", text: "Users").trigger("click")

    find("a", text: "Add a user").trigger("click")

    find("#email").set("jade@doe.org")
    find("#name").set("Jade")
    check("active")

    find("button", text: "Create user").trigger("click")

    expect(page).to have_content("User has been created")

    expect(page).to have_content("jade@doe.org")
  end

  scenario "I can see validation errors" do
    find("nav a", text: "Users").trigger("click")

    find("a", text: "Add a user").trigger("click")

    find("#email").set("")
    find("#name").set("Jade")
    check("active")

    find("button", text: "Create user").trigger("click")

    expect(page).to have_content("must be filled")
  end
end
