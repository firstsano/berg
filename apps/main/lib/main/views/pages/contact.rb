require "main/import"
require "main/view"
require "main/decorators/public_person"

module Main
  module Views
    module Pages
      class Contact < Main::View
        include Main::Import("persistence.repositories.office_contact_details")

        configure do |config|
          config.template = "pages/contact"
        end

        def locals(options = {})
          super.merge(
            contact_details: office_contact_details.for_contact_page,
          )
        end
      end
    end
  end
end
