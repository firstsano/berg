require "berg/repository"
require "main/entities/external_post"

module Main
  module Persistence
    module Repositories
      class ExternalPosts < Berg::Repository[:external_posts]
        def for_home_page
          external_posts
            .published
            .limit(6)
            .order(Sequel.desc(:published_at))
            .as(Entities::ExternalPost)
        end
      end
    end
  end
end
