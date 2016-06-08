require "admin/import"
require "admin/entities/curated_post"
require "admin/curated_posts/validation/form"
require "dry-result_matcher"
require "kleisli"

module Admin
  module CuratedPosts
    module Operations
      class Update
        include Admin::Import("admin.persistence.repositories.curated_posts")

        include Dry::ResultMatcher.for(:call)

        def call(id, attributes)
          validation = Validation::Form.(attributes)

          if validation.success?
            curated_posts.update(id, validation.to_h)
            Right(curated_posts[id])
          else
            Left(validation)
          end
        end
      end
    end
  end
end
