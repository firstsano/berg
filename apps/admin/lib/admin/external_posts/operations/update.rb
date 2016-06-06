require "admin/import"
require "admin/entities/external_post"
require "admin/external_posts/validation/form"
require "kleisli"

module Admin
  module ExternalPosts
    module Operations
      class Update
        include Admin::Import("admin.persistence.repositories.external_posts")

        include Dry::ResultMatcher.for(:call)

        def call(id, attributes)
          validation = Validation::Form.(attributes)

          if validation.success?
            external_posts.update(id, validation.to_h)
            Right(external_posts[id])
          else
            Left(validation)
          end
        end
      end
    end
  end
end
