require "admin/import"
require "admin/entities/category"
require "admin/categories/validation/form"
require "dry-result_matcher"
require "kleisli"

module Admin
  module Categories
    module Operations
      class Create
        include Admin::Import(
          "admin.persistence.repositories.categories",
          "admin.slugify",
        )

        include Dry::ResultMatcher.for(:call)

        def call(attributes)
          validation = Validation::Form.(attributes)

          if validation.success?
            category = Entities::Category.new(categories.create(prepare_attributes(validation.output)))
            Right(category)
          else
            Left(validation)
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
