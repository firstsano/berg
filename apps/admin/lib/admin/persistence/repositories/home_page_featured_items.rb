require "berg/repository"
require "admin/entities"

module Admin
  module Persistence
    module Repositories
      class HomePageFeaturedItems < Berg::Repository[:home_page_featured_items]
        struct_namespace Admin::Entities

        def update(attrs)
          command(:home_page_featured_items)[:update].(attrs)
        end

        def listing
          home_page_featured_items.order(:position)
        end
      end
    end
  end
end
