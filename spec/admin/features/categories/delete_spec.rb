require "admin_app_helper"

RSpec.feature "Admin / Categories / Delete", js: true do
  include_context "admin users"
  include_context "admin people"
  include_context "admin categories"

  background do
    sign_in(jane.email, jane.password)
    create_category("Ruby")
  end

  scenario "I can delete a category" do
    visit "/admin/categories"

    within("#category-ruby}") do
      click_link "Delete"
    end

    expect(page).to have_content("Category has been deleted", wait: 1)

    expect(page).to_not have_content("Ruby")
  end

  xscenario "I can delete a category and see that it has been removed from a post" do
    visit "/admin/posts"

    click_link "Add a post"

    find("#title").set("A sample title")
    find("#teaser").set("A teaser for this sample article")
    find("#body").set("Some sample content for this post")
    find("input[name='post[person_id]']", visible: false).set(jane.id)

    find(:xpath, "//button[contains(@class, 'selection-field')]", match: :first).trigger("click")
    find(:xpath, "//button[contains(@class, 'selection-field__optionButton')][div='#{sample_person.name}']").trigger("click")

    find(:xpath, "//button[contains(@class, 'multi-selection-field')]").trigger("click")
    find(:xpath, "//button[contains(@class, 'multi-selection-field__optionButton')][div='Ruby']").trigger("click")

    find("button", text: "Create post").trigger("click")

    expect(page).to have_content("Post has been created", wait: 1)

    find("a", text: "A sample title").trigger("click")
    expect(page).to have_content("Ruby")

    visit "/admin/categories"

    within("#category-ruby") do
      click_link "Delete"
    end

    visit "/admin/posts/a-sample-title/edit"
    expect(page).to_not have_content "Ruby"
  end
end
