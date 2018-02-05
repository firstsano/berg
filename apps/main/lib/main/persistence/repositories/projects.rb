require "berg/repository"
require "main/entities"

module Main
  module Persistence
    module Repositories
      class Projects < Berg::Repository[:projects]
        struct_namespace Main::Entities

        def by_slug(slug)
          projects.by_slug(slug).one
        end

        def listing
          projects.published.order(Sequel.desc(:published_at))
        end
      end
    end
  end
end
