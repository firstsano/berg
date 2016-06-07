require "berg/repository"
require "main/entities/slug"

module Main
  module Persistence
    module Repositories
      class Sitemaps < Berg::Repository[:sitemaps]
        relations :posts, :projects

        def all_posts
          posts
            .published
            .as(Entities::Slug)
        end

        def all_projects
          projects
            .published
            .as(Entities::Slug)
        end
      end
    end
  end
end
