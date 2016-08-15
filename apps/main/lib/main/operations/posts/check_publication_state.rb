require "main/import"
require "berg/matcher"

module Main
  module Operations
    module Posts
      class CheckPublicationState
        include Main::Import("persistence.repositories.posts")
        include Berg::Matcher

        def call(slug)
          post = posts.by_slug(slug)

          if post && post.status == "published"
            Dry::Monads::Right(post)
          else
            Dry::Monads::Left("This post has not yet been published.")
          end
        end
      end
    end
  end
end
