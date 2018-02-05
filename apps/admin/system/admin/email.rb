require "berg/email"
require "admin/container"

module Admin
  class Email < Berg::Email
    configure do |config|
      config.paths = [Container.root.join("emails")]
      config.template = "email"
    end
  end
end
