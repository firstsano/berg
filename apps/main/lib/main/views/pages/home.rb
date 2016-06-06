require "main/import"
require "main/view"
require "main/entities/home_page_featured_item"
require "main/decorators/home_page_post"
require "main/decorators/public_post"
require "main/decorators/public_external_post"
require "main/persistence/post_mixer"

module Main
  module Views
    module Pages
      class Home < Main::View
        include Main::Import(
          "main.persistence.repositories.home_page_featured_items",
          "main.persistence.repositories.posts",
          "main.persistence.repositories.external_posts",
        )

        configure do |config|
          config.template = "pages/home"
        end

        def locals(options = {})
          combined_home_page_posts = Main::Persistence::PostMixer.new(
            Decorators::PublicPost.decorate(posts.for_home_page),
            Decorators::PublicExternalPost.decorate(external_posts.for_home_page)
          ).posts
          super.merge(
            posts: Decorators::HomePagePost.decorate(combined_home_page_posts),
            featured_items: home_page_featured_items.listing
          )
        end
      end
    end
  end
end
