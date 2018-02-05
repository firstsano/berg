require "berg/form"

module Admin
  module CuratedPosts
    module Forms
      class Form < Berg::Form
        prefix :curated_post

        define do
          text_field :title, label: "Title", hint: "(optional)"
          text_area :body, label: "Body", hint: "(optional, markdown supported)"

          group do
            text_field :link_title, label: "Link title"
            text_field :link_url, label: "Link URL"
          end
          group do
            text_field :image_url, label: "Image URL"
            upload_field :image_upload,
              label: "Image Upload",
              presign_url: "#{Berg::Container.settings.canonical_domain}/admin/uploads/presign"
          end

          group do
            select_box :status, label: "Status", options: dep(:status_list)
            date_time_field :published_at, label: "Published at"
          end
        end

        def status_list
          Types::PostStatus.values.map { |value| [value, value.capitalize] }
        end
      end
    end
  end
end
