require "main/import"
require "main/view"
require "main/decorators/public_post"

module Main
  module Views
    module Posts
      module Category
        class Index < Main::View
          include Main::Import[
            "persistence.repositories.posts",
            "persistence.repositories.categories",
          ]

          configure do |config|
            config.template = "posts/category/index"
          end

          def locals(options = {})
            options = {per_page: 20, page: 1}.merge(options)

            category_slug = options.fetch(:category)
            category      = categories.by_slug!(category_slug)
            all_posts     = posts.for_category(category.id, page: options[:page], per_page: options[:per_page])
            posts         = Decorators::PublicPost.decorate(all_posts)

            super.merge(
              category: category,
              indexed_posts: posts.map.with_index { |post, i| OpenStruct.new(index: i, post: post) },
              paginator: all_posts.pager
            )
          end
        end
      end
    end
  end
end
