require "berg/form"

module Admin
  module CuratedPosts
    module Forms
      class Form < Berg::Form

        prefix :curated_post

        define do
          group do
            text_field :title, label: "Title"
            text_field :website_url, label: "Website URL"
          end
          group do
            text_field :image_url, label: "Image URL"
            upload_field :image_upload,
              label: "Image Upload",
              presign_url: "#{Berg::Container["config"].canonical_domain}/admin/uploads/presign"
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
