require "admin/import"
require "admin/view"

module Admin
  module Views
    module CuratedPosts
      class Edit < Admin::View
        include Admin::Import[
          "persistence.repositories.curated_posts",
          "curated_posts.forms.form",
        ]

        configure do |config|
          config.template = "curated_posts/edit"
        end

        def locals(options = {})
          curated_post = curated_posts[options.fetch(:id)]

          validation = options[:validation]

          super.merge(
            curated_post: curated_post,
            form: curated_post_form(curated_post, validation)
          )
        end

        private

        def curated_post_form(curated_post, validation)
          if validation
            form.build(validation, validation.messages)
          else
            form.build(curated_post)
          end
        end
      end
    end
  end
end
