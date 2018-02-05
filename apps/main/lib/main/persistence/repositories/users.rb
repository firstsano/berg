require "berg/repository"
require "main/entities"

module Main
  module Persistence
    module Repositories
      class Users < Berg::Repository[:users]
        struct_namespace Main::Entities

        def [](id)
          users.by_id(id).one!
        end
      end
    end
  end
end
