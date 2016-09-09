source "https://rubygems.org"

ruby "2.3.1"

gem "rake"

# Web framework
gem "puma"
gem "dry-web"
gem "dry-web-roda"
gem "rack_csrf"
gem "rack-rewrite"
gem "rack-ssl"
gem "notgun"

# Database persistence
gem "pg"
gem "rom"
gem "rom-mapper"
gem "rom-repository"
gem "rom-sql"

# Background jobs
gem "que"

# Application dependencies
gem "babosa"
gem "bcrypt"
gem "dry-equalizer"
gem "dry-matcher"
gem "dry-transaction"

gem "dry-validation", "~> 0.10"
gem "dry-types", "~> 0.9"
gem "dry-struct", "~> 0.1"

gem "dry-view", git: "https://github.com/dry-rb/dry-view", branch: "master"
gem "dry-system"
gem "fog-aws"
gem "formalist", git: "https://github.com/icelab/formalist", branch: "master"
gem "i18n"
gem "mime-types"
gem "redcarpet"
gem "rouge"
gem "sitemap_generator"
gem "slim"
gem "builder"
gem "transproc", git: "https://github.com/solnic/transproc"

# 3rd party services
gem "bugsnag"
gem "postmark"

group :development, :test do
  gem "danger"
  gem "danger-rubocop", git: "https://github.com/ashfurrow/danger-rubocop"
  gem "faker"
  gem "guard-rspec", require: false
  gem "pry-byebug"
  gem "rubocop"
  gem "foreman"
end

group :test do
  gem "capybara", require: false
  gem "capybara-screenshot", require: false
  gem "codeclimate-test-reporter", require: nil
  gem "database_cleaner"
  gem "inflecto"
  gem "poltergeist"
  gem "rspec"
  gem "site_prism"
  gem "timecop"
end
