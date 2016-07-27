require "berg/repository"
require "main/entities/post"

module Main
  module Persistence
    module Repositories
      class Posts < Berg::Repository[:posts]
        relations :posts, :people, :categories

        def by_slug(slug)
          aggregate(:author, :categories)
            .by_slug(slug)
            .as(Entities::Post::WithAuthorAndCategories)
            .one
        end

        def listing(page: 1, per_page: 20)
          aggregate(:author)
            .published
            .per_page(per_page).page(page)
            .order(Sequel.desc(:published_at))
            .as(Entities::Post::WithAuthor)
        end

        def for_home_page
          aggregate(:author)
            .published
            .limit(10)
            .order(Sequel.desc(:published_at))
            .as(Entities::Post::WithAuthor)
        end

        def for_rss_feed
          aggregate(:author)
            .published
            .order(Sequel.desc(:published_at))
            .limit(20)
            .as(Entities::Post::WithAuthor)
        end

        def for_category(category_id, page: 1, per_page: 20)
          aggregate(:author)
            .published
            .for_category(category_id)
            .per_page(per_page).page(page)
            .order(Sequel.desc(:published_at))
            .as(Entities::Post::WithAuthor)
        end
      end
    end
  end
end
