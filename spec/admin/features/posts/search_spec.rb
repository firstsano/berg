require "admin_app_helper"

RSpec.feature "Admin / Posts / Search", js: true do
  include_context "admin people"
  include_context "admin users"
  include_context "admin posts"

  background do
    sign_in(jane.email, jane.password)
  end

  scenario "I can search for a post by text in its title" do
    searchable_post =  create_post("Searchable post title")

    visit "/admin/posts"

    find(:css, "input[type='search']").set("Search")
    find("button", text: "Go").trigger("click")

    expect(page).to have_content(searchable_post.title)
    expect(page).to_not have_content(sample_post.title)
  end

  scenario "I can search for a post by text in its body" do
    searchable_post =  create_post("Searchable post title", body: "Lorem ipsum and such")

    visit "/admin/posts"

    find(:css, "input[type='search']").set("such")
    find("button", text: "Go").trigger("click")

    expect(page).to have_content(searchable_post.title)
    expect(page).to_not have_content(sample_post.title)
  end

  scenario "Found posts are weigted by their title" do
    first_post =  create_post("lorem lorem lorem bar")
    second_post =  create_post("lorem lorem bar bar")

    visit "/admin/posts"

    find(:css, "input[type='search']").set("lorem")
    find("button", text: "Go").trigger("click")

    sleep 1 #because page load ¯\_(ツ)_/¯

    found_titles = page.all(:css, "tr > td > a").map(&:text)

    expect(found_titles).to eq([first_post.title, second_post.title])
  end
end
