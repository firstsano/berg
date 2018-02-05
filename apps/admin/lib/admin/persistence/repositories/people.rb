require "berg/repository"
require "admin/entities"

module Admin
  module Persistence
    module Repositories
      class People < Berg::Repository[:people]
        struct_namespace Admin::Entities

        commands :create, update: :by_slug

        def [](id)
          people.by_id(id).one!
        end

        def by_slug(slug)
          people.by_slug(slug).one!
        end

        def by_email!(email)
          people.by_email(email).one!
        end

        def by_name(name)
          people.by_name(name).one
        end

        def listing(per_page: 20, page: 1)
          people.per_page(per_page).page(page).order(:name)
        end

        def all_people
          people.order(:name)
        end
      end
    end
  end
end
