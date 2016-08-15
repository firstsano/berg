require "main/import"
require "berg/matcher"

module Main
  module Operations
    module Projects
      class CheckPublicationState
        include Main::Import["persistence.repositories.projects"]
        include Berg::Matcher

        def call(slug)
          project = projects.by_slug(slug)

          if project && project.status == "published"
            Dry::Monads::Right(project)
          else
            Dry::Monads::Left("This project has not yet been published.")
          end
        end
      end
    end
  end
end
