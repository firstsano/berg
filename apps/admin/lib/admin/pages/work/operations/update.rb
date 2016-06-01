require "admin/import"
require "kleisli"

module Admin
  module Pages
    module Work
      module Operations
        class Update
          include Admin::Import(
            "core.persistence.commands.update_work_page_featured_items"
          )

          include Dry::ResultMatcher.for(:call)

          def call(attributes)
            validation = Validation::Form.(attributes)

            if validation.success?
              work_page_featured_items = update_work_page_featured_items.(validation.to_h)
              Right(work_page_featured_items)
            else
              Left(validation)
            end
          end
        end
      end
    end
  end
end
