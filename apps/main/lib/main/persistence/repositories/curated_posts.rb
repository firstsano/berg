require "berg/repository"
require "main/entities/curated_post"

module Main
  module Persistence
    module Repositories
      class CuratedPosts < Berg::Repository[:curated_posts]
        def for_home_page
          curated_posts
            .published
            .limit(6)
            .order(Sequel.desc(:published_at))
            .as(Entities::CuratedPost)
        end
      end
    end
  end
end
