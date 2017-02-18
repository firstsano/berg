require_relative "admin/container"
require "medium"

# Load manually registered dependencies
Admin::Container.require "system/container/persistence"

Admin::Container.finalize! do |container|
  require "admin/enqueue"
  container.register :enqueue, Admin::Enqueue.new
  container.register :medium_client, ::Medium::Client.new(
    integration_token: Berg::Container["config"].medium_integration_token
  )
end

require "admin/application"
require "admin/view"
require "admin/transactions"

Admin::Container.require "transactions/**/*.rb"
