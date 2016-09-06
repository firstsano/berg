require "admin_app_helper"

RSpec.feature "Admin / Activation", js: true do
  include_context "admin users"

  before do
    Timecop.freeze(Time.now)
  end

  scenario "I can activate my account by setting my password" do
    visit("/admin/reset-password/#{jane.access_token}")

    find("#password").set("super-secret")
    find("button", text: "Save").trigger("click")

    find(".nav-list__link", text: "Users").trigger("click")

    expect(page).to have_content("#{jane.email}")
  end

  scenario "I see validation errors when password was invalid" do
    visit("/admin/reset-password/#{jane.access_token}")

    find("#password").set("ab")
    find("button", text: "Save").trigger("click")

    expect(page).to have_content("size cannot be less than 8")
  end

  scenario "I am redirected to sign-in page when token is not valid" do
    visit("/admin/reset-password/not-good")

    expect(page).to have_content("Token is invalid or expired")
    expect(page).to have_content("Sign in")
  end

  scenario "I am redirected to sign-in page when token has expired" do
    # Tokens are valid for two days, so advance 3 days
    Timecop.travel(Time.now + 3 * 24 * 60 * 60)

    visit("/admin/reset-password/#{jane.access_token}")

    expect(page).to have_content("Token is invalid or expired")
    expect(page).to have_content("Sign in")
  end

  scenario "The access token is cleared when my password is set successfully" do
    visit("/admin/reset-password/#{jane.access_token}")

    find("#password").set("super-secret")
    find("button", text: "Save").trigger("click")

    expect(page).to have_content("Your password has been set")

    find("nav a", text: "Log out").trigger("click")

    expect(page).to have_content("You are now signed out")

    visit("/admin/reset-password/#{jane.access_token}")

    expect(page).to have_content("Token is invalid or expired")
  end
end
