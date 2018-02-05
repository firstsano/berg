require "berg/repository"
require "admin/entities"

module Admin
  module Persistence
    module Repositories
      class Projects < Berg::Repository[:projects]
        struct_namespace Admin::Entities

        commands :create, update: [:by_id, :by_slug]

        alias_method :update, :update_by_id

        def [](id)
          projects.by_id(id).one!
        end

        def by_slug!(slug)
          projects.by_slug(slug).one!
        end

        def slug_exists?(slug)
          !!projects.matching_slugs(slug).one
        end

        def listing(per_page: 20, page: 1)
          projects.per_page(per_page).page(page).order(Sequel.desc(:published_at))
        end

        def all
          projects.order(Sequel.desc(:published_at))
        end

        def recent_colors
          projects
            .select(:color)
            .order(Sequel.desc(:created_at))
            .limit((Types::PostHighlightColor.values.count / 2).floor)
            .map { |p| p[:color] }
        end
      end
    end
  end
end
