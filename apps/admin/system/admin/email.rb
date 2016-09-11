require "umbrella/email"
require "admin/container"

module Admin
  class Email < Umbrella::Email
    configure do |config|
      config.paths = [Container.root.join("emails")]
      config.name = "email"
    end
  end
end
