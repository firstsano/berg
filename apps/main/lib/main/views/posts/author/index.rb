require "main/import"
require "main/view"
require "main/decorators/public_post"

module Main
  module Views
    module Posts
      module Author
        class Index < Main::View
          include Main::Import[
            "persistence.repositories.posts",
            "persistence.repositories.people",
          ]

          configure do |config|
            config.template = "posts/author/index"
          end

          def locals(options = {})
            options = {per_page: 20, page: 1}.merge(options)

            author_id = options.fetch(:author)
            author    = people.by_id!(author_id)
            all_posts = posts.for_person(author.id, page: options[:page], per_page: options[:per_page])
            posts     = Decorators::PublicPost.decorate(all_posts)

            super.merge(
              author: author,
              indexed_posts: posts.map.with_index { |post, i| OpenStruct.new(index: i, post: post) },
              paginator: all_posts.pager
            )
          end
        end
      end
    end
  end
end
