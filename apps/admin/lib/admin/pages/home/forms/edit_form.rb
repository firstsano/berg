require "berg/form"

module Admin
  module Pages
    module Home
      module Forms
        class EditForm < Berg::Form
          include Admin::Import(
            "admin.persistence.repositories.home_page_featured_items"
          )

          prefix :page

          define do
            many :home_page_featured_items,
              label: "Featured Items",
              action_label: "Add a featured item",
              placeholder: "No featured items added yet." do
                text_field :title,
                  label: "Title",
                  validation: {
                    filled: true
                  }

                text_field :teaser,
                  label: "Teaser",
                  validation: {
                    filled: true
                  }

                text_field :url,
                  label: "URL",
                  validation: {
                    filled: true
                  }

                text_field :highlight_color,
                  label: "Highlight Colour",
                  placeholder: "Six-digit hexadecimal code, without the leading #",
                  validation: {
                    filled: true,
                    format: "/^([a-fA-F0-9]{3}|[a-fA-F0-9]{6})$/"
                  }

                upload_field :cover_image,
                  label: "Cover Image",
                  presign_url: "/admin/uploads/presign",
                  validation: {
                    filled: true
                  }
              end
          end
        end
      end
    end
  end
end
