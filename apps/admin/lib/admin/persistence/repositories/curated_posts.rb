require "berg/repository"
require "admin/entities/curated_post"

module Admin
  module Persistence
    module Repositories
      class CuratedPosts < Berg::Repository[:curated_posts]
        commands :create, update: [:by_id]

        def [](id)
          curated_posts.by_id(id).as(Entities::CuratedPost).one
        end

        def listing(per_page: 20, page: 1)
          curated_posts
            .per_page(per_page)
            .page(page)
            .order(Sequel.desc(:created_at))
            .as(Entities::CuratedPost)
        end
      end
    end
  end
end
