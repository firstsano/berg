require "admin/import"
require "admin/view"

module Admin
  module Views
    module People
      class New < Admin::View
        include Admin::Import("admin.people.forms.form")

        configure do |config|
          config.template = "people/new"
        end

        def locals(options = {})
          super.merge(
            form: form_data(options[:validation])
          )
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
