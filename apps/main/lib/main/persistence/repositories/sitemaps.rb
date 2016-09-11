require "umbrella/repository"

module Main
  module Persistence
    module Repositories
      class Sitemaps < Umbrella::Repository
        relations :posts, :projects

        def post_slugs
          posts
            .published
            .select(:slug)
            .map { |p| p[:slug] }
        end

        def project_slugs
          projects
            .published
            .select(:slug)
            .map { |p| p[:slug] }
        end
      end
    end
  end
end
