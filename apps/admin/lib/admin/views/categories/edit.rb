require "admin/import"
require "admin/view"
require "admin/categories/forms/form"

module Admin
  module Views
    module Categories
      class Edit < Admin::View
        include Admin::Import(
          "admin.persistence.repositories.categories",
          "admin.categories.forms.form",
        )

        configure do |config|
          config.template = "categories/edit"
        end

        def locals(options = {})
          category = categories.by_slug(options[:slug])

          category_validation = options[:category_validation]

          super.merge(
            category: category,
            form: category_form(category, category_validation)
          )
        end

        private

        def category_form(category, validation)
          if validation
            form.build(validation, validation.messages)
          else
            form.build(category)
          end
        end
      end
    end
  end
end
