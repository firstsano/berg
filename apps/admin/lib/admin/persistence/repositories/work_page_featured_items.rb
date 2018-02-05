require "berg/repository"
require "admin/entities"

module Admin
  module Persistence
    module Repositories
      class WorkPageFeaturedItems < Berg::Repository[:work_page_featured_items]
        struct_namespace Admin::Entities

        def update(attrs)
          command(:work_page_featured_items)[:update].(attrs)
        end

        def listing
          work_page_featured_items.order(:position)
        end
      end
    end
  end
end
