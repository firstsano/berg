require "berg/repository"
require "admin/entities"

module Admin
  module Persistence
    module Repositories
      class CuratedPosts < Berg::Repository[:curated_posts]
        struct_namespace Admin::Entities

        commands :create, update: [:by_id]

        def [](id)
          curated_posts.by_id(id).one!
        end

        def listing(per_page: 20, page: 1)
          curated_posts.per_page(per_page).page(page).order(Sequel.desc(:created_at))
        end
      end
    end
  end
end
