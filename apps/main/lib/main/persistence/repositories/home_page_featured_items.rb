require "umbrella/repository"
require "main/entities/home_page_featured_item"

module Main
  module Persistence
    module Repositories
      class HomePageFeaturedItems < Umbrella::Repository[:home_page_featured_items]
        relations :home_page_featured_items

        def listing
          home_page_featured_items
            .order(:position)
            .as(Entities::HomePageFeaturedItem)
        end
      end
    end
  end
end
