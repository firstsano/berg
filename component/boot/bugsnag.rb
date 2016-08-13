Berg::Container.finalize(:bugsnag) do |container|
  uses :config

  require "bugsnag"

  Bugsnag.configure do |c|
    c.project_root = Pathname(__FILE__).join("../..").realpath.dirname.freeze
    c.release_stage = ENV.fetch("RACK_ENV", "development")
    c.notify_release_stages = ["production"]
    c.api_key = config.bugsnag_api_key
    c.logger.level = Logger::INFO
  end
end
