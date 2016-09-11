require "umbrella/email"
require "main/container"

module Main
  class Email < Umbrella::Email
    configure do |config|
      config.paths = Container.root.join("emails")
      config.name = "email"
    end
  end
end
