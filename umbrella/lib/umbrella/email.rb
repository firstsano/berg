require "berg/email"
require "umbrella/import"

module Umbrella
  class Email < Berg::Email
    include Umbrella::Import[t: "i18n.t"]
  end
end
