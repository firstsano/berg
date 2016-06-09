require "main_app_helper"

RSpec.feature "Main / Home / Show", js: false do
  include_context 'main people'
  include_context 'main posts'
  include_context 'main curated_posts'
  include_context 'main categories'

  before do
    @author = create_person("Jane Doe", "person@example.com", "bio")
    11.times do |i|
      create_post("foo #{i+1}", "teaser-foo-#{i+1}", "foo-#{i+1}", @author)
    end
    7.times do |i|
      create_curated_post("cool image #{i}")
    end
  end

  scenario "I can view a list of notes and external posts" do
    visit "/"

    expect(page.all(:css, "img[title^='cool image']").length).to eq 6
    expect(page.all(:css, "li[data-test-color]:not([data-test-color=''])").length).to eq 10
  end

end
