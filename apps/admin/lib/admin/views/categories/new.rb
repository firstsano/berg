require "admin/import"
require "admin/view"
require "admin/categories/forms/form"

module Admin
  module Views
    module Categories
      class New < Admin::View
        include Admin::Import("admin.categories.forms.form")

        configure do |config|
          config.template = "categories/new"
        end

        def locals(options = {})
          super.merge(form: form_data(options[:validation]))
        end

        def form_data(validation)
          if validation
            form.build(validation, validation.messages)
          else
            form.build
          end
        end
      end
    end
  end
end
