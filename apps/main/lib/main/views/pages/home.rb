require "main/import"
require "main/view"
require "main/entities/home_page_featured_item"
require "main/decorators/public_post"
require "main/decorators/public_curated_post"
require "main/views/post_mixer"

module Main
  module Views
    module Pages
      class Home < Main::View
        include Main::Import[
          "persistence.repositories.home_page_featured_items",
          "persistence.repositories.posts",
          "persistence.repositories.curated_posts",
        ]

        configure do |config|
          config.template = "pages/home"
        end

        def locals(options = {})
          curated_posts_for_home_page = curated_posts.for_home_page
          combined_home_page_posts = Main::Views::PostMixer.new(
            Decorators::PublicPost.decorate(posts.for_home_page),
            Decorators::PublicCuratedPost.decorate(curated_posts_for_home_page)
          ).posts

          super.merge(
            combined_posts: combined_home_page_posts,
            curated_posts_for_home_page: curated_posts_for_home_page,
            featured_items: home_page_featured_items.listing
          )
        end
      end
    end
  end
end
