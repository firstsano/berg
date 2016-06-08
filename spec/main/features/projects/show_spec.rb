require "main_app_helper"

RSpec.feature "Main / Projects / Show", js: false do
  include_context "main_projects"

  before do
    5.times do |i|
      create_project("foo #{i + 1}")
    end
  end

  scenario "I can view a project's detail page" do
    visit "/work"
    click_link "foo 1"

    expect(page.current_path).to eq "/work/foo-1"
    expect(page).to have_content "the body"
  end

  scenario "I see a 404 page when trying to view an un-published project" do
    create_project("Secret project", "draft")

    visit "/work/secret-project"

    expect(page.current_path).to eq "/work/secret-project"
    expect(page).to have_content "Oops! We couldn’t find this page."
  end
end
