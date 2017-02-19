Berg::Container.finalize(:medium_client) do |_container|
  uses :config

  require "medium"

  Berg::Container.register "medium_client", Medium::Client.new(
    integration_token: Berg::Container["config"].medium_integration_token)
end
