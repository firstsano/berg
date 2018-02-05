require "berg/repository"
require "admin/entities"

module Admin
  module Persistence
    module Repositories
      class Categories < Berg::Repository[:categories]
        struct_namespace Admin::Entities

        commands :create, delete: [:by_slug], update: [:by_slug]

        def [](id)
          categories.by_id(id).one!
        end

        def by_slug(slug)
          categories.by_slug(slug).one
        end

        def slug_exists?(slug)
          !!categories.matching_slugs(slug).one
        end

        def listing
          categories.order(:name)
        end
      end
    end
  end
end
