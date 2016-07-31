source "https://rubygems.org"

ruby "2.3.1"

gem "rake"

# Web framework
gem "puma"
gem "dry-web", "~> 0.2"
gem "dry-web-roda", "~> 0.1"
gem "rack_csrf"
gem "rack-rewrite"
gem "rack-ssl"
gem "shotgun"

# Database persistence
gem "pg"
gem "rom", git: "https://github.com/rom-rb/rom"
gem "rom-mapper", git: "https://github.com/rom-rb/rom-mapper"
gem "rom-repository", git: "https://github.com/rom-rb/rom-repository"
gem "rom-sql", git: "https://github.com/rom-rb/rom-sql"
gem "rom-support", git: "https://github.com/rom-rb/rom-support"

# Background jobs
gem "que"

# Application dependencies
gem "babosa"
gem "bcrypt"
gem "dry-equalizer"
gem "dry-result_matcher"
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
gem "builder"
gem "transproc", git: "https://github.com/solnic/transproc"

# 3rd party services
gem "bugsnag"
gem "postmark"

group :development, :test do
  gem "danger"
  gem "danger-rubocop"
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
end
