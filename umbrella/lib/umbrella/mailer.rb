require "umbrella/container"
require "umbrella/import"

module Umbrella
  class Mailer
    include Umbrella::Import["logger", "postmark"]

    def deliver(mail)
      logger.debug("[Umbrella::Mailer] delivering: #{mail.inspect}")
      postmark.deliver(mail.to_h.merge(from: from))
    end

    private

    def from
      options.app_mailer_from_email
    end

    def options
      Container["config"]
    end
  end
end
