require "berg/repository"
require "main/entities"

module Main
  module Persistence
    module Repositories
      class People < Berg::Repository[:people]
        struct_namespace Main::Entities

        def for_about_page
          people.for_about_page
        end

        def by_id!(id)
          people.by_id(id).one!
        end

        def by_slug!(slug)
          people.by_slug(slug).one!
        end
      end
    end
  end
end
