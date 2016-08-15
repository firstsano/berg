require "main/import"
require "main/view"
require "main/decorators/public_curated_post"

module Main
  module Views
    module CuratedPosts
      class Index < Main::View
        include Main::Import["persistence.repositories.curated_posts"]

        configure do |config|
          config.template = "curated_posts/index"
        end

        def locals(options = {})
          options = {per_page: 20, page: 1}.merge(options)
          all_curated_posts = curated_posts.listing(page: options[:page], per_page: options[:per_page])

          super.merge(
            curated_posts: Decorators::PublicCuratedPost.decorate(all_curated_posts),
            paginator: all_curated_posts.pager
          )
        end
      end
    end
  end
end
