require "berg/repository"
require "main/entities/person"

module Main
  module Persistence
    module Repositories
      class People < Berg::Repository[:people]
        relations :people

        def for_about_page
          people
            .for_about_page
            .as(Entities::Person)
        end

        def by_id!(id)
          people
            .by_id(id)
            .as(Entities::Person)
            .one!
        end

        def by_slug!(slug)
          people
            .by_slug(slug)
            .as(Entities::Person)
            .one!
        end
      end
    end
  end
end
