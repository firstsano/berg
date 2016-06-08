require "berg/form"

module Admin
  module Posts
    module Forms
      class CreateForm < Berg::Form
        include Admin::Import[
          "admin.persistence.repositories.people",
          "admin.persistence.repositories.categories"
        ]

        prefix :post

        define do
          section :post do
            group do
              text_field :title,
                label: "Title",
                validation: {
                  filled: true
                }
            end
            group do
              text_area :teaser,
                label: "Teaser",
                validation: {
                  filled: true
                }
              selection_field :person_id,
                label: "Author",
                options: dep(:author_list),
                validation: {
                  filled: true
                }
            end

            text_area :body,
              label: "Body",
              validation: {
                filled: true
              }

            multi_selection_field :post_categories,
              label: "Categories",
              selector_label: "Choose categories",
              options: dep(:categories_list)

            upload_field :cover_image,
              label: "Cover Image",
              hint: "Will be displayed on the notes index page",
              presign_url: "/admin/uploads/presign"

          end
        end

        def author_list
          people.all_people.to_a.map { |person| { id: person.id, label: person.name } }
        end

        def categories_list
          categories.listing.to_a.map { |category|
            {
              id: category.id,
              label: category.name,
              slug: category.slug
            }
          }
        end
      end
    end
  end
end
