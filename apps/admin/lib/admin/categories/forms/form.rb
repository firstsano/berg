require "berg/form"

module Admin
  module Categories
    module Forms
      class Form < Berg::Form
        include Admin::Import["admin.persistence.repositories.categories"]

        prefix :category

        define do
          text_field :name, label: "Name",
          validation: {
            filled: true
          }
          text_field :slug, label: "Slug",
          validation: {
            filled: true
          }
        end
      end
    end
  end
end
