require "berg/form"

module Admin
  module People
    module Forms
      class Form < Berg::Form
        prefix :person

        define do
          group do
            text_field :name, label: "Name"
          end

          group do
            text_field :email,
              label: "Email",
              validation: {
                filled: true,
                format: EMAIL_VALIDATION_REGEX
              }
            text_field :job_title, label: "Job Title"
          end

          text_area :bio, label: "Bio"
          text_area :short_bio, label: "Short Bio"

          upload_field :avatar_image,
            label: "Avatar",
            hint: "An image of this person",
            presign_url: "#{Berg::Container["config"].canonical_domain}/admin/uploads/presign"

          group label: "Social" do
            text_field :website_url, label: "Website URL", placeholder: "http://icelab.com.au", hint: "(optional)"
            text_field :twitter_handle, label: "Twitter Username", placeholder: "icelab", hint: "(optional)"
          end
        end
      end
    end
  end
end
