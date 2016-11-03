require "admin/container"
require "berg/validation/form"

module Admin
  module People
    module Validation
      Form = Berg::Validation.Form do
        configure do
          config.messages = :i18n

          option :person_slug_uniqueness_check, Admin::Container["persistence.person_slug_uniqueness_check"]

          def slug_unique?(value)
            person_slug_uniqueness_check.(value)
          end

          def not_eql?(input, value)
            !input.eql?(value)
          end
        end

        required(:bio).filled
        required(:short_bio).filled
        required(:name).filled
        required(:city).filled

        optional(:slug).filled
        optional(:previous_slug).maybe
        required(:job_title).maybe(:str?)
        required(:avatar_image).maybe(:hash?)
        required(:twitter_handle).maybe(:str?)
        required(:website_url).maybe(:uri?)

        rule(slug: [:slug, :previous_slug]) do |slug, previous_slug|
          slug.not_eql?(previous_slug).then(slug.slug_unique?)
        end
      end
    end
  end
end
