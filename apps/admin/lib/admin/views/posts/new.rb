require "admin/import"
require "admin/view"

module Admin
  module Views
    module Posts
      class New < Admin::View
        include Admin::Import["posts.forms.create_form"]

        configure do |config|
          config.template = "posts/new"
        end

        def locals(options = {})
          super.merge(
            query: nil,
            form: form_data(options[:validation])
          )
        end

        def form_data(validation)
          if validation
            create_form.build(validation, validation.messages)
          else
            create_form.build
          end
        end
      end
    end
  end
end
