require "admin_app_helper"

RSpec.feature "Admin / People / Edit", js: true do
  include_context "admin users"
  include_context "admin people"

  before(:each) do
    @person = create_person("John Doe", "john.doe@example.com", "A bio for John Doe")
  end

  background do
    sign_in(jane.email, jane.password)
  end

  scenario "I can edit a person" do
    find("nav a", text: "People").trigger("click")

    within "#person-#{@person.id}" do
      click_link @person.name
    end

    find("#name").set("Ben Kenobi")
    find("#bio").set("Jedi Master")
    find("#short_bio").set("Jedi")

    find("button", text: "Save changes").trigger("click")

    expect(page).to have_content("Person has been updated")

    expect(page).to have_content("Ben Kenobi")
  end

  scenario "I can see validation errors" do
    find("nav a", text: "People").trigger("click")

    within "#person-#{@person.id}" do
      click_link @person.name
    end

    find("#name").set("Madonna")
    find("#bio").set("")
    find("#short_bio").set("Singer")

    find("button", text: "Save changes").trigger("click")

    expect(page).to have_content("must be filled")
  end
end
