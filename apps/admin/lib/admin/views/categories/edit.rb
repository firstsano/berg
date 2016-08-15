require "admin/import"
require "admin/view"
require "admin/categories/forms/form"

module Admin
  module Views
    module Categories
      class Edit < Admin::View
        include Admin::Import(
          "persistence.repositories.categories",
          "categories.forms.form",
        )

        configure do |config|
          config.template = "categories/edit"
        end

        def locals(options = {})
          category = categories.by_slug(options[:slug])

          validation = options[:validation]

          super.merge(
            category: category,
            form: category_form(category, validation)
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
