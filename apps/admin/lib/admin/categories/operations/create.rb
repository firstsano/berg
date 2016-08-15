require "admin/import"
require "admin/entities/category"
require "admin/categories/validation/form"
require "berg/matcher"

module Admin
  module Categories
    module Operations
      class Create
        include Admin::Import(
          "persistence.repositories.categories",
          "slugify",
        )

        include Berg::Matcher

        def call(attributes)
          validation = Validation::Form.(attributes)

          if validation.success?
            category = Entities::Category.new(categories.create(prepare_attributes(validation.output)))
            Dry::Monads::Right(category)
          else
            Dry::Monads::Left(validation)
          end
        end

        private

        def prepare_attributes(attributes)
          attributes.merge(
            slug: slugify.(attributes[:name], categories.method(:slug_exists?)),
          )
        end
      end
    end
  end
end
