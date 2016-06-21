require "berg/repository"
require "admin/entities/project"
require "admin/entities/asset"

module Admin
  module Persistence
    module Repositories
      class Projects < Berg::Repository[:projects]
        commands :create, update: [:by_id, :by_slug]

        alias_method :update, :update_by_id

        def [](id)
          projects.by_id(id).as(Entities::Project).one
        end

        def by_slug(slug)
          projects.by_slug(slug).as(Entities::Project).one
        end

        def slug_exists?(slug)
          !!projects.matching_slugs(slug).one
        end

        def listing(per_page: 20, page: 1)
          projects
            .per_page(per_page)
            .page(page)
            .order(Sequel.desc(:published_at))
            .as(Entities::Project)
        end

        def recent_colors
          projects
            .select(:color)
            .order(Sequel.desc(:created_at))
            .limit((Types::PostHighlightColor.values.count / 2).floor)
            .map{ |p| p[:color] }
        end
      end
    end
  end
end
