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

          required(:office_locations).each do
            schema do
              required(:name).filled
              required(:address).filled
              required(:phone_number).filled
              required(:latitude).filled
              required(:longitude).filled
            end
          end
        end
      end
    end
  end
end
