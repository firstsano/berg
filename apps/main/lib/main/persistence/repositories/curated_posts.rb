require "berg/repository"
require "main/entities"

module Main
  module Persistence
    module Repositories
      class CuratedPosts < Berg::Repository[:curated_posts]
        struct_namespace Main::Entities

        def for_home_page
          curated_posts.published.limit(6).order(Sequel.desc(:published_at))
        end

        def listing(page: 1, per_page: 20)
          curated_posts.published.per_page(per_page).page(page).order(Sequel.desc(:published_at))
        end
      end
    end
  end
end
