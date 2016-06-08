require "berg/form"

module Admin
  module People
    module Forms
      class Form < Berg::Form
        prefix :person

        define do
          group do
            text_field :name, label: "Name",
              validation: {
                filled: true
              }
            text_field :email,
              label: "Email",
              validation: {
                filled: true,
                format: EMAIL_VALIDATION_REGEX
              }
          end

          group do
            text_field :job_title, label: "Job Title",
              validation: {
                filled: true
              }
            text_field :city, label: "City",
              validation: {
                filled: true
              }
          end

          text_area :bio, label: "Bio",
            validation: {
              filled: true
            }
          text_area :short_bio, label: "Short Bio",
            validation: {
              filled: true
            }

          upload_field :avatar_image,
            label: "Avatar",
            hint: "An image of this person",
            presign_url: "/admin/uploads/presign"

          group label: "Social" do
            text_field :website_url, label: "Website URL", placeholder: "http://icelab.com.au", hint: "(optional)"
            text_field :twitter_handle, label: "Twitter Username", placeholder: "icelab", hint: "(optional)"
          end
        end
      end
    end
  end
end
