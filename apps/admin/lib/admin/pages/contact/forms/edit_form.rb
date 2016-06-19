require "berg/form"

module Admin
  module Pages
    module Contact
      module Forms
        class EditForm < Berg::Form

          prefix :page

          define do
            many :office_locations do
              text_field :name,
                label: "Location Name",
                validation: {
                  filled: true
                }
              text_area :address,
                label: "Address",
                validation: {
                  filled: true
                }
              text_field :phone_number,
                label: "Phone Number",
                validation: {
                  filled: true
                }
            end
          end
        end
      end
    end
  end
end
