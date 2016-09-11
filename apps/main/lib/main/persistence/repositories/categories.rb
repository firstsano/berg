require "umbrella/repository"
require "main/entities/category"

module Main
  module Persistence
    module Repositories
      class Categories < Umbrella::Repository[:categories]
        relations :categories, :posts, :users

        def by_slug!(slug)
          categories
            .by_slug(slug)
            .as(Entities::Category)
            .one!
        end
      end
    end
  end
end
