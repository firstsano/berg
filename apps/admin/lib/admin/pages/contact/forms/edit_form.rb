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
                label: "Location Name"
              text_field :address,
                label: "Address"
              text_field :phone_number,
                label: "Phone Number"
            end
          end
        end
      end
    end
  end
end
