require "berg/repository"
require "main/entities/work_page_featured_item"

module Main
  module Persistence
    module Repositories
      class WorkPageFeaturedItems < Berg::Repository[:work_page_featured_items]
        def listing
          work_page_featured_items
            .order(:position)
            .as(Entities::WorkPageFeaturedItem)
        end
      end
    end
  end
end
