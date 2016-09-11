require "umbrella/repository"

module Admin
  module Persistence
    module Repositories
      class HomePageFeaturedItems < Umbrella::Repository[:home_page_featured_items]
        def update(attrs)
          command(:home_page_featured_items)[:update].(attrs)
        end

        def listing
          home_page_featured_items
            .order(:position)
        end
      end
    end
  end
end
