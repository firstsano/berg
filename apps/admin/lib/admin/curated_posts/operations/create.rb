require "admin/import"
require "admin/entities/curated_post"
require "admin/curated_posts/validation/form"
require "kleisli"

module Admin
  module CuratedPosts
    module Operations
      class Create
        include Admin::Import("admin.persistence.repositories.curated_posts")

        include Dry::ResultMatcher.for(:call)

        def call(attributes)
          validation = Validation::Form.(attributes)

          if validation.success?
            post = Admin::Entities::CuratedPost.new(curated_posts.create(validation.to_h))
            Right(post)
          else
            Left(validation)
          end
        end
      end
    end
  end
end
