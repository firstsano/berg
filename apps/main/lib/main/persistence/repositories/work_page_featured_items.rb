require "umbrella/repository"
require "main/entities/work_page_featured_item"

module Main
  module Persistence
    module Repositories
      class WorkPageFeaturedItems < Umbrella::Repository[:work_page_featured_items]
        relations :work_page_featured_items

        def listing
          work_page_featured_items
            .order(:position)
            .as(Entities::WorkPageFeaturedItem)
        end
      end
    end
  end
end
