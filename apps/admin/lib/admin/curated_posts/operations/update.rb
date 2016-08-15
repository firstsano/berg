require "admin/import"
require "admin/entities/curated_post"
require "admin/curated_posts/validation/form"
require "berg/matcher"

module Admin
  module CuratedPosts
    module Operations
      class Update
        include Admin::Import["persistence.repositories.curated_posts"]

        include Berg::Matcher

        def call(id, attributes)
          validation = Validation::Form.(attributes)

          if validation.success?
            curated_posts.update(id, validation.to_h)
            Dry::Monads::Right(curated_posts[id])
          else
            Dry::Monads::Left(validation)
          end
        end
      end
    end
  end
end
