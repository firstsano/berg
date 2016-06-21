require "admin/container"
require "berg/validation/form"

module Admin
  module People
    module Validation
      Form = Berg::Validation.Form do
        configure do
          config.messages = :i18n
        end

        required(:bio).filled
        required(:short_bio).filled
        required(:name).filled
        required(:city).filled

        required(:job_title).maybe(:str?)
        required(:avatar_image).maybe(:hash?)
        required(:twitter_handle).maybe(:str?)
        required(:website_url).maybe(:uri?)
      end
    end
  end
end
