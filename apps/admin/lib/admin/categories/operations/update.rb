require "admin/import"
require "admin/entities/category"
require "admin/categories/validation/form"
require "berg/matcher"

module Admin
  module Categories
    module Operations
      class Update
        include Admin::Import["persistence.repositories.categories"]

        include Berg::Matcher

        def call(slug, attributes)
          validation = Validation::Form.(prepare_attributes(slug, attributes))

          if validation.success?
            categories.update(slug, validation.output)
            Dry::Monads::Right(categories.by_slug(validation.output.fetch(:slug) { slug }))
          else
            Dry::Monads::Left(validation)
          end
        end

        private

        def prepare_attributes(slug, attributes)
          attributes.merge(
            previous_slug: slug,
          )
        end
      end
    end
  end
end
