require "admin_app_helper"

RSpec.feature "Admin / Curated Posts / Create", js: true do
  include_context "admin users"

  background do
    sign_in(jane.email, jane.password)
  end

  scenario "I can create a curated post" do
    find("nav a", text: "Curated Posts").trigger("click")

    find("a", text: "Add a curated post").trigger("click")

    find("#title").set("Cool image")
    find("#website_url").set("http://foo.bar/")
    find("#image_url").set("http://foo.bar/image.png")
    select("Published", from: "Status")
    find("input[name='curated_post[published_at]']", visible: false).set(Time.now)

    find("button", text: "Create post").trigger("click")

    expect(page).to have_content("Curated Post has been created")

    expect(page).to have_content("Cool image")
  end

  scenario "I can see validation errors" do
    find("nav a", text: "Curated Posts").trigger("click")

    find("a", text: "Add a curated post").trigger("click")

    find("#title").set("Cool image")
    find("#website_url").set("http://foo.bar/")
    select("Published", from: "Status")
    find("input[name='curated_post[published_at]']", visible: false).set(Time.now)

    find("button", text: "Create post").trigger("click")

    expect(page).to have_content("You must fill in 'Image URL' or 'Image Upload'")
  end
end
