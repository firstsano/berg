require "berg/repository"
require "admin/entities/person"

module Admin
  module Persistence
    module Repositories
      class People < Berg::Repository[:people]
        relations :people
        commands :create, update: [:by_id]

        def [](id)
          people.by_id(id).as(Entities::Person).one!
        end

        def by_email!(email)
          people.by_email(email).as(Entities::Person).one!
        end

        def listing(per_page: 20, page: 1)
          people
            .per_page(per_page)
            .page(page)
            .order(:name)
            .as(Entities::Person)
        end

        def all_people
          people
            .order(:name)
            .as(Entities::Person)
        end
      end
    end
  end
end
