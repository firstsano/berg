require "byebug" if ENV["RACK_ENV"] == "development"
require "pry" if ENV["RACK_ENV"] == "development"

require_relative "umbrella/container"

Umbrella::Container.finalize! do |container|
  # Boot the app config before everything else
  container.boot! :config
end

require_relative "umbrella/persistence"

app_paths = Pathname(__FILE__).dirname.join("../../apps").realpath.join("*")
Dir[app_paths].each do |f|
  require "#{f}/system/boot"
end

require_relative "umbrella/application"
