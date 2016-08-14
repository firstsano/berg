require "admin/import"
require "admin/entities/post"
require "admin/posts/validation/form"
require "berg/matcher"

module Admin
  module Posts
    module Operations
      class Create
        include Admin::Import(
          "admin.persistence.repositories.posts",
          "admin.slugify",
          "admin.persistence.post_color_picker",
        )

        include Berg::Matcher

        def call(attributes)
          validation = Validation::Form.(attributes)

          if validation.success?
            post = Admin::Entities::Post.new(posts.create(prepare_attributes(validation.to_h)))
            Dry::Monads::Right(post)
          else
            Dry::Monads::Left(validation)
          end
        end

        private

        def prepare_attributes(attributes)
          attributes.merge(
            slug: slugify.(attributes[:title], posts.method(:slug_exists?)),
            color: post_color_picker.()
          )
        end
      end
    end
  end
end
