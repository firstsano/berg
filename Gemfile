source "https://rubygems.org"

ruby "2.3.1"

gem "rake"

# Web framework
gem "dry-web", "~> 0.8"
gem "dry-web-roda", "~> 0.9"
gem "notgun"
gem "puma"
gem "rack-rewrite"
gem "rack-ssl"
gem "rack_csrf"

# Database persistence
gem "pg", "~> 1.0"
gem "rom", "~> 4.1"
gem "rom-sql", "~> 2.1"

# Background jobs
gem "que"

# Application dependencies
gem "babosa"
gem "bcrypt"
gem "builder"
gem "dry-equalizer"
gem "dry-matcher"
gem "dry-transaction", "~> 0.10"
gem "dry-types", "~> 0.12"
gem "dry-validation", "~> 0.11"
gem "dry-view", "~> 0.5"
gem "fog-aws"
gem "formalist", git: "https://github.com/icelab/formalist", branch: "master"
gem "i18n"
gem "mime-types"
gem "redcarpet"
gem "sitemap_generator"
gem "slim"
gem "transproc", git: "https://github.com/solnic/transproc"

# 3rd party services
gem "bugsnag"
gem "postmark"

group :development, :test do
  gem "bundler-audit", require: false
  gem "danger"
  gem "danger-rubocop", git: "https://github.com/ashfurrow/danger-rubocop"
  gem "faker"
  gem "foreman"
  gem "guard-rspec", require: false
  gem "icelab-style", git: "https://github.com/icelab/icelab-style"
  gem "pry-byebug"
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
