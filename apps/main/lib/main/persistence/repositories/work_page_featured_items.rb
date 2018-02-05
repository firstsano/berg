require "berg/repository"
require "main/entities"

module Main
  module Persistence
    module Repositories
      class WorkPageFeaturedItems < Berg::Repository[:work_page_featured_items]
        struct_namespace Main::Entities

        def listing
          work_page_featured_items.order(:position)
        end
      end
    end
  end
end
