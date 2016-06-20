require "admin/import"
require "admin/view"
require "admin/pages/contact/forms/edit_form"

module Admin
  module Views
    module Pages
      module Contact
        class Edit < Admin::View
          include Admin::Import(
            "admin.persistence.repositories.office_contact_details",
            "admin.pages.contact.forms.edit_form",
          )

          configure do |config|
            config.template = "pages/contact/edit"
          end

          def locals(options = {})
            office_locations = office_contact_details.listing_by_position

            validation = options[:validation]

            super.merge(
              page_form: page_form(form_input(office_locations), validation)
            )
          end

          private

          def page_form(office_locations, validation)
            if validation
              edit_form.build(validation, validation.messages)
            else
              edit_form.build(office_locations)
            end
          end

          def form_input(office_locations)
            { office_locations: office_locations.map { |location_details|
                {
                  name: location_details[:name],
                  address: location_details[:address],
                  phone_number: location_details[:phone_number],
                  latitude: location_details[:latitude],
                  longitude: location_details[:longitude]
                }
              }
            }
          end
        end
      end
    end
  end
end
