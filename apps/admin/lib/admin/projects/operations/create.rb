require "admin/import"
require "admin/entities/project"
require "admin/projects/validation/form"
require "berg/matcher"

module Admin
  module Projects
    module Operations
      class Create
        include Admin::Import(
          "persistence.repositories.projects",
          "slugify",
          "persistence.project_color_picker",
        )

        include Berg::Matcher

        def call(attributes)
          validation = Validation::Form.(attributes)

          if validation.success?
            project = Entities::Project.new(projects.create(prepare_attributes(validation.output)))
            Dry::Monads::Right(project)
          else
            Dry::Monads::Left(validation)
          end
        end

        private

        def prepare_attributes(attributes)
          attributes.merge(
            slug: slugify.(attributes[:title], projects.method(:slug_exists?)),
            color: project_color_picker.()
          )
        end
      end
    end
  end
end
