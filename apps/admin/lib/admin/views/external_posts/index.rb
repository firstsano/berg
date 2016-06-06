require "admin/import"
require "admin/paginator"
require "admin/view"

module Admin
  module Views
    module ExternalPosts
      class Index < Admin::View
        include Admin::Import("admin.persistence.repositories.external_posts")

        configure do |config|
          config.template = "external_posts/index"
        end

        def locals(options = {})
          page      = options[:page] || 1
          per_page  = options[:per_page] || 20

          all_posts = external_posts.listing(page: page, per_page: per_page)
          admin_external_posts = all_posts.to_a.map { |a| Decorators::ExternalPost.new(a) }

          super.merge(
            external_posts: admin_external_posts,
            paginator: Paginator.new(all_posts.pager, url_template: "/admin/external_posts?page=%")
          )
        end
      end
    end
  end
end
