require "admin/import"
require "admin/view"
require "admin/posts/forms/edit_form"

module Admin
  module Views
    module Posts
      class Edit < Admin::View
        include Admin::Import(
          "admin.persistence.repositories.posts",
          "admin.persistence.repositories.categories",
          "admin.posts.forms.edit_form",
        )

        configure do |config|
          config.template = "posts/edit"
        end

        def locals(options = {})
          post = posts.by_slug(options.fetch(:slug))

          validation = options[:validation]

          super.merge(
            post: post,
            form: post_form(post, validation)
          )
        end

        private

        def post_form(post, validation)
          if validation
            edit_form.build(validation, validation.messages)
          else
            edit_form.build(form_input(post))
          end
        end

        def form_input(post)
          categories = post.post_categories
          post.to_h.merge(
            post_categories: categories.map(&:id)
          )
        end
      end
    end
  end
end
