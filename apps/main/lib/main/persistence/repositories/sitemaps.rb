require "berg/repository"

module Main
  module Persistence
    module Repositories
      class Sitemaps < Berg::Repository[:sitemaps]
        relations :posts, :projects

        def post_slugs
          posts
            .published
            .to_a
            .map(&:slug)
        end

        def project_slugs
          projects
            .published
            .to_a
            .map(&:slug)
        end
      end
    end
  end
end
