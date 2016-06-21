require_relative "../component/boot"
require "faker"

def core
  Berg::Container
end

def main
  Main::Container
end

def admin
  Admin::Container
end

def create_user(attrs)
  admin["admin.users.operations.create"].call(attrs).value
end

def create_person(attrs)
  admin["admin.people.operations.create"].call(attrs).value
end

def create_post(attrs)
  admin["admin.posts.operations.create"].call(attrs).value
end

def create_project(attrs)
  admin["admin.projects.operations.create"].call(attrs).value
end

def create_category(attrs)
  admin["admin.categories.operations.create"].call(attrs).value
end

create_user(
  email: "hello@icelab.com.au",
  name: "Icelab Admin",
  active: true
)

create_person(
  name: "Icelab Person",
  bio: "An icelab person",
  short_bio: "An icelab person",
  job_title: "Developer",
  website_url: nil,
  twitter_handle: "",
  avatar_image: nil,
  city: "Melbourne"
)

author = admin["admin.persistence.repositories.people"].by_email!("person@icelab.com.au")
admin["admin.users.operations.change_password"].(1, { password: "changeme" })

20.times do |n|
  create_post(
    title: Faker::Hipster.sentence,
    teaser: Faker::Hipster.sentence,
    body: Faker::Hipster.paragraph,
    status: "published",
    person_id: author.id,
    published_at: Time.now,
    cover_image: nil,
    post_categories: [1]
  )
end

20.times do |n|
  create_project(
    title: Faker::Hipster.sentence,
    client: Faker::Company.name,
    url: Faker::Internet.url,
    intro: Faker::Hipster.sentence,
    body: Faker::Hipster.paragraph,
    status: "draft",
    case_study: false,
    cover_image: nil
  )
end

{ ruby: "Ruby",
  dry_web: "dry-web",
  rails: "Rails",
  javascript: "Javascript",
  ios: "iOS",
  design: "Design",
  react: "React" }.each do |slug, name|
    create_category(name: name, slug: slug.to_s)
end
