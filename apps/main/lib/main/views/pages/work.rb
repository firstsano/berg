require "main/import"
require "main/view"

module Main
  module Views
    module Pages
      class Work < Main::View
        include Main::Import(
          "main.persistence.repositories.work_page_featured_items",
          "main.persistence.repositories.projects"
        )

        configure do |config|
          config.template = "pages/work"
        end

        def locals(options = {})
          super.merge(
            featured_items: work_page_featured_items.listing,
            projects: projects.listing
          )
        end
      end
    end
  end
end
