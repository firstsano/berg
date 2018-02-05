require "berg/repository"
require "main/entities"

module Main
  module Persistence
    module Repositories
      class Categories < Berg::Repository[:categories]
        struct_namespace Main::Entities

        def by_slug!(slug)
          categories.by_slug(slug).one!
        end
      end
    end
  end
end
