require "admin/import"
require "admin/paginator"
require "admin/view"

module Admin
  module Views
    module CuratedPosts
      class Index < Admin::View
        include Admin::Import("admin.persistence.repositories.curated_posts")

        configure do |config|
          config.template = "curated_posts/index"
        end

        def locals(options = {})
          page      = options[:page] || 1
          per_page  = options[:per_page] || 20

          all_posts = curated_posts.listing(page: page, per_page: per_page)
          admin_curated_posts = all_posts.to_a.map { |a| Decorators::CuratedPost.new(a) }

          super.merge(
            curated_posts: admin_curated_posts,
            paginator: Paginator.new(all_posts.pager, url_template: "/admin/curated_posts?page=%")
          )
        end
      end
    end
  end
end
