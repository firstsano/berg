require "berg/repository"
require "main/entities"

module Main
  module Persistence
    module Repositories
      class HomePageFeaturedItems < Berg::Repository[:home_page_featured_items]
        struct_namespace Main::Entities

        def listing
          home_page_featured_items.order(:position)
        end
      end
    end
  end
end
