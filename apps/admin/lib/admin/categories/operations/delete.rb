require "admin/import"
require "admin/entities/category"
require "admin/categories/validation/form"
require "berg/matcher"

module Admin
  module Categories
    module Operations
      class Delete
        include Admin::Import("admin.persistence.repositories.categories")

        include Berg::Matcher

        def call(slug)
          categories.delete(slug)
        end
      end
    end
  end
end
