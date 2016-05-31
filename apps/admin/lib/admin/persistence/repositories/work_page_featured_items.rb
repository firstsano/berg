require "berg/repository"

module Admin
  module Persistence
    module Repositories
      class WorkPageFeaturedItems < Berg::Repository[:work_page_featured_items]
        relations :work_page_featured_items

        def listing_by_position
          work_page_featured_items
            .order(:position)
        end
      end
    end
  end
end
