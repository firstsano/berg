require "admin/import"
require "admin/entities/post"
require "admin/posts/validation/form"
require "berg/matcher"

module Admin
  module Posts
    module Operations
      class Update
        include Admin::Import[repo: "persistence.repositories.posts"]

        include Berg::Matcher

        def call(slug, attributes)
          validation = Validation::Form.(prepare_attributes(slug, attributes))

          if validation.success?
            _result = repo.update_by_slug(slug, validation.to_h)

            Dry::Monads::Right(repo.by_slug!(validation.to_h.fetch(:slug) { slug }))
          else
            Dry::Monads::Left(validation)
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
