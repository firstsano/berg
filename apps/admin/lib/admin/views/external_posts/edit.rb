require "admin/import"
require "admin/view"

module Admin
  module Views
    module ExternalPosts
      class Edit < Admin::View
        include Admin::Import(
          "admin.persistence.repositories.external_posts",
          "admin.external_posts.forms.form",
        )

        configure do |config|
          config.template = "external_posts/edit"
        end

        def locals(options = {})
          external_post = external_posts[options.fetch(:id)]

          validation = options[:validation]

          super.merge(
            external_post: external_post,
            form: external_post_form(external_post, validation)
          )
        end

        private

        def external_post_form(external_post, validation)
          if validation
            form.build(validation, validation.messages)
          else
            form.build(external_post)
          end
        end
      end
    end
  end
end
