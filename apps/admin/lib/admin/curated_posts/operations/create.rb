require "admin/import"
require "admin/entities/curated_post"
require "admin/curated_posts/validation/form"
require "berg/matcher"

module Admin
  module CuratedPosts
    module Operations
      class Create
        include Admin::Import["persistence.repositories.curated_posts"]

        include Berg::Matcher

        def call(attributes)
          validation = Validation::Form.(attributes)

          if validation.success?
            post = Admin::Entities::CuratedPost.new(curated_posts.create(validation.to_h))
            Dry::Monads::Right(post)
          else
            Dry::Monads::Left(validation)
          end
        end
      end
    end
  end
end
