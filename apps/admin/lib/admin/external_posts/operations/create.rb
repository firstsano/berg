require "admin/import"
require "admin/entities/post"
require "admin/external_posts/validation/form"
require "kleisli"

module Admin
  module ExternalPosts
    module Operations
      class Create
        include Admin::Import("admin.persistence.repositories.external_posts")

        include Dry::ResultMatcher.for(:call)

        def call(attributes)
          validation = Validation::Form.(attributes)

          if validation.success?
            post = Admin::Entities::ExternalPost.new(external_posts.create(validation.to_h))
            Right(post)
          else
            Left(validation)
          end
        end
      end
    end
  end
end
