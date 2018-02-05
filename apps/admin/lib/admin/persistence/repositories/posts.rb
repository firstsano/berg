require "berg/repository"
require "admin/entities/post"
require "admin/entities/asset"

module Admin
  module Persistence
    module Repositories
      class Posts < Berg::Repository[:posts]
        commands update: [:by_id, :by_slug]
        alias_method :update, :update_by_id

        def create(attrs)
          command(:posts)[:create].(attrs)
        end

        def update_by_slug(slug, attrs)
          command(:posts)[:update].by_slug(slug).(attrs)
        end

        def [](id)
          posts.by_id(id).as(Entities::Post).one!
        end

        def by_slug!(slug)
          aggregate(:categories)
            .by_slug(slug)
            .as(Entities::PostWithCategories)
            .one!
        end

        def slug_exists?(slug)
          !!posts.matching_slugs(slug).one
        end

        def listing(per_page: 20, page: 1)
          posts
            .per_page(per_page)
            .page(page)
            .order(Sequel.desc(:published_at))
            .as(Entities::Post)
        end

        def recent_colors
          posts
            .select(:color)
            .order(Sequel.desc(:created_at))
            .limit((Types::PostHighlightColor.values.count / 2).floor)
            .map { |p| p[:color] }
        end
      end
    end
  end
end
