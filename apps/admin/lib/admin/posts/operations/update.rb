require "admin/import"
require "admin/entities/post"
require "admin/posts/validation/form"
require "dry-result_matcher"
require "kleisli"

module Admin
  module Posts
    module Operations
      class Update
        include Admin::Import(
          repo: "admin.persistence.repositories.posts",
        )

        include Dry::ResultMatcher.for(:call)

        def call(slug, attributes)
          validation = Validation::Form.(prepare_attributes(slug, attributes))

          if validation.success?
            _result = repo.update_by_slug(slug, validation.to_h)

            Right(repo.by_slug!(validation.to_h.fetch(:slug) { slug }))
          else
            Left(validation)
          end
        end

        private

        def prepare_attributes(slug, attributes)
          attributes.merge(
            previous_slug: slug
          )
        end
      end
    end
  end
end
