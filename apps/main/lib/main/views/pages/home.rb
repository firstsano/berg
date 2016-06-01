require "main/import"
require "main/view"
require "main/entities/home_page_featured_item"

module Main
  module Views
    module Pages
      class Home < Main::View
        include Main::Import(
          "main.persistence.repositories.home_page_featured_items"
        )

        configure do |config|
          config.template = "pages/home"
        end

        def locals(options = {})
          super.merge(
            featured_items: home_page_featured_items.listing
          )
        end
      end
    end
  end
end
