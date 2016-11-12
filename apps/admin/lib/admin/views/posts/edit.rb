require "admin/import"
require "admin/view"
require "admin/decorators/asset"

module Admin
  module Views
    module Posts
      class Edit < Admin::View
        include Admin::Import[
          "persistence.repositories.posts",
          "persistence.repositories.categories",
          "posts.forms.edit_form",
        ]

        configure do |config|
          config.template = "posts/edit"
        end

        def locals(options = {})
          post = posts.by_slug!(options.fetch(:slug))

          validation = options[:validation]

          super.merge(
            post: post,
            query: nil,
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
          categories = post.categories
          assets = Decorators::Asset.decorate(post.assets).map(&:to_input_h)

          post.to_h.merge(
            categories: categories.map(&:id),
            assets: assets
          )
        end
      end
    end
  end
end
