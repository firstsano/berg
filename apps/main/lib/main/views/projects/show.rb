require "main/import"
require "main/view"
require "main/decorators/public_project"

module Main
  module Views
    module Projects
      class Show < Main::View
        include Main::Import("persistence.repositories.projects")

        configure do |config|
          config.template = "projects/show"
        end

        def locals(options = {})
          super.merge(
            project: Decorators::PublicProject.decorate(projects.by_slug(options[:slug]))
          )
        end
      end
    end
  end
end
