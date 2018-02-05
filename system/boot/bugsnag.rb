Berg::Container.boot(:bugsnag) do |berg|
  init do
    require "logger"
    require "bugsnag"
  end

  start do
    Bugsnag.configure do |c|
      c.project_root = berg.root.to_s
      c.release_stage = berg.env.to_s
      c.notify_release_stages = ["production"]
      c.api_key = berg.settings.bugsnag_api_key
      c.logger.level = Logger::INFO
    end
  end
end
