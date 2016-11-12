require "admin/import"
require "admin/paginator"
require "admin/view"

module Admin
  module Views
    module Posts
      class Index < Admin::View
        include Admin::Import["persistence.repositories.posts"]

        configure do |config|
          config.template = "posts/index"
        end

        def locals(options = {})
          page      = options[:page] || 1
          per_page  = options[:per_page] || 20

          all_posts = posts.listing(page: page, per_page: per_page)
          admin_posts = Decorators::Post.decorate(all_posts)

          super.merge(
            posts: admin_posts,
            query: nil,
            paginator: Paginator.new(all_posts.pager, url_template: "/admin/posts?page=%")
          )
        end
      end
    end
  end
end
