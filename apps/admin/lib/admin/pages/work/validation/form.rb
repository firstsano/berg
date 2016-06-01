require "admin/container"
require "berg/validation/form"

module Admin
  module Pages
    module Work
      module Validation
        Form = Berg::Validation.Form do
          configure do
            config.messages = :i18n
          end

          required(:work_page_featured_items).each do
            required(:title).filled
            required(:description).filled
            required(:url).filled
            required(:cover_image).filled
          end
        end
      end
    end
  end
end
