require "admin_app_helper"

RSpec.feature "Admin / Pages / Contact / Edit", js: true do
  include_context "admin users"

  background do
    sign_in(jane.email, jane.password)
  end

  scenario "I can edit the contact page to add an office location" do
    find("nav a", text: "Contact").trigger("click")

    find("button", text: "Add item").trigger("click")

    find("#name").set("Melbourne")
    find("#phone_number").set("03 9123 4567")
    find("#address").set("123 Fake Street")

    find("button", text: "Save changes").trigger("click")

    expect(page).to have_content("Page has been updated")

    visit "/contact"

    expect(page).to have_content "Melbourne"
    expect(page).to have_content "123 Fake Street"
  end

  scenario "I can see validation errors" do
    find("nav a", text: "Contact").trigger("click")

    find("button", text: "Add item").trigger("click")

    find("#name").set("Melbourne")
    find("#phone_number").set("03 9123 4567")

    find("button", text: "Save changes").trigger("click")

    expect(page).to have_content("must be filled")
  end
end
