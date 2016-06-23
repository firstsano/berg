require "app_helper"

RSpec.feature "Main / Pages" do
  scenario "Visiting the Home page" do
    visit "/"
    expect(page.status_code).to eql 200
    expect(page).to have_title "Icelab, an Australian design and development studio"
  end

  scenario "Visiting the Work page" do
    visit "/work"
    expect(page.status_code).to eql 200
    expect(page).to have_title "Work — Icelab"
  end

  scenario "Visiting the About page" do
    visit "/about"
    expect(page.status_code).to eql 200
    expect(page).to have_title "About — Icelab"
  end

  scenario "Visiting the Notes page" do
    visit "/notes"
    expect(page.status_code).to eql 200
    expect(page).to have_title "Notes — Icelab"
  end

  scenario "Visiting the Contact page" do
    visit "/contact"
    expect(page.status_code).to eql 200
    expect(page).to have_title "Contact — Icelab"
  end

  scenario "Visiting a non-existent top-level page" do
    visit "/foo"
    expect(page.status_code).to eql 404
    expect(page).to have_content "Oops! We couldn’t find this page"
  end

  scenario "Visiting a non-existent Project's page" do
    visit "/work/foo"
    expect(page.status_code).to eql 404
    expect(page).to have_content "Oops! We couldn’t find this page"
  end

  scenario "Visiting a non-existent Post's page" do
    visit "/notes/foo"
    expect(page.status_code).to eql 404
    expect(page).to have_content "Oops! We couldn’t find this page"
  end

  scenario "Visiting a non-existent Category's page" do
    visit "/notes/category/foo"
    expect(page.status_code).to eql 404
    expect(page).to have_content "Oops! We couldn’t find this page"
  end
end
