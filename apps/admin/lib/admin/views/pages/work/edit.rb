require "admin/import"
require "admin/pages/work/forms/edit_form"
require "admin/view"

module Admin
  module Views
    module Pages
      module Work
        class Edit < Admin::View
          include Admin::Import(
            "admin.persistence.repositories.work_page_featured_items",
            "admin.pages.work.forms.edit_form"
          )

          configure do |config|
            config.template = "pages/work/edit"
          end

          def locals(options = {})
            featured_items = {
              work_page_featured_items: work_page_featured_items.listing.map(&:to_h)
            }

            super.merge(
              page_form: form_data(featured_items, options[:validation]),
              csrf_token: options[:scope].csrf_token
            )
          end

          private

          def form_data(featured_items, validation)
            if validation
              edit_form.build(validation, validation.messages)
            else
              edit_form.build(featured_items)
            end
          end
        end
      end
    end
  end
end
