require "berg/form"

module Admin
  module Pages
    module Work
      module Forms
        class EditForm < Berg::Form
          include Admin::Import(
            "admin.persistence.repositories.work_page_featured_items"
          )

          prefix :page

          define do
            many :work_page_featured_items,
              label: "Featured Items",
              action_label: "Add a featured item",
              placeholder: "No featured items added yet." do
                text_field :title,
                  label: "Title"

                text_field :description,
                  label: "Description"

                text_field :url,
                  label: "URL"

                upload_field :cover_image,
                  label: "Cover Image",
                  presign_url: "/admin/uploads/presign"
                end
          end
        end
      end
    end
  end
end
