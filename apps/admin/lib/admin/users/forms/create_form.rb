require "berg/form"

module Admin
  module Users
    module Forms
      class CreateForm < Berg::Form
        prefix :user

        define do
          text_field :email,
            label: "Email",
            validation: {
              filled: true,
              format: EMAIL_VALIDATION_REGEX
            }
          text_field :name, label: "Name"
          check_box :active, label: "Status", question_text: "Mark as active?"
        end
      end
    end
  end
end
