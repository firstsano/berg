require "admin/container"
require "berg/validation/form"

module Admin
  module People
    module Validation
      Form = Berg::Validation.Form do
        configure do
          config.messages = :i18n

          option :person_email_uniqueness_check, Admin::Container["admin.persistence.person_email_uniqueness_check"]

          def email_unique?(value)
            person_email_uniqueness_check.(value)
          end

          def not_eql?(input, value)
            !input.eql?(value)
          end
        end

        required(:email).filled
        required(:bio).filled
        required(:short_bio).filled
        required(:name).filled

        required(:job_title).maybe(:str?)
        optional(:previous_email).maybe
        required(:avatar_image).maybe(:hash?)
        required(:twitter_handle).maybe(:str?)
        required(:website_url).maybe(:uri?)

        rule(email: [:email, :previous_email]) do |email, previous_email|
          email.not_eql?(previous_email).then(email.email_unique?)
        end
      end
    end
  end
end
