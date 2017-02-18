require "admin/import"
require "admin/entities/post"
require "berg/matcher"

module Admin
  module Posts
    module Operations
      module Share
        class Medium
          include Admin::Import[
            "persistence.repositories.posts",
            create_medium_post: "medium_client.create_post"
          ]

          include Berg::Matcher

          def call(slug)
            post = posts.by_slug!(slug)
            medium_post = create_medium_post.(prepare_post(post))

            if medium_post.success?
              response = JSON.parse(medium_post.body)
              posts.update_by_id(post.id, medium_url: response["data"]["url"])
              Dry::Monads::Right(post)
            else
              Dry::Monads::Left(post)
            end
          end

          private

          def prepare_post(post)
            {
              title: post.title,
              content_format: "html",
              content: post.body,
              tags: post.categories.map(&:name),
              canonical_url: "#{Berg::Container["config"].canonical_domain}/notes/#{post.slug}",
              publishStatus: "public"
            }
          end
        end
      end
    end
  end
end
