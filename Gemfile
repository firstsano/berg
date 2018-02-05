source "https://rubygems.org"

ruby "2.3.1"

gem "rake"

# Web framework
gem "dry-web"
gem "dry-web-roda"
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
gem "dry-system"
gem "dry-transaction"
gem "dry-types", "~> 0.8"
gem "dry-validation", "~> 0.8"
gem "dry-view", git: "https://github.com/dry-rb/dry-view", branch: "master"
gem "fog-aws"
gem "formalist", git: "https://github.com/icelab/formalist", branch: "master"
gem "i18n"
gem "mime-types"
gem "redcarpet"
gem "rouge"
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
