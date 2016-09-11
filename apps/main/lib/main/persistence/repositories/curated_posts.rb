require "umbrella/repository"
require "main/entities/curated_post"

module Main
  module Persistence
    module Repositories
      class CuratedPosts < Umbrella::Repository[:curated_posts]
        def for_home_page
          curated_posts
            .published
            .limit(6)
            .order(Sequel.desc(:published_at))
            .as(Entities::CuratedPost)
        end

        def listing(page: 1, per_page: 20)
          curated_posts
            .published
            .per_page(per_page)
            .page(page)
            .order(Sequel.desc(:published_at))
            .as(Entities::CuratedPost)
        end
      end
    end
  end
end
