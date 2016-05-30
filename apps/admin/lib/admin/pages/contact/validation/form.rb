require "admin/container"
require "berg/validation/form"

module Admin
  module Pages
    module Contact
      module Validation
        Form = Berg::Validation.Form do
          configure do
            config.messages = :i18n
          end

          key(:office_locations).each do
            schema do
              key(:name).required
              key(:address).required
              key(:phone_number).required
            end
          end
        end
      end
    end
  end
end
