require "admin/import"
require "admin/entities/project"
require "admin/projects/validation/form"
require "berg/matcher"

module Admin
  module Projects
    module Operations
      class Update
        include Admin::Import(
          "admin.persistence.repositories.projects"
        )

        include Berg::Matcher

        def call(slug, attributes)
          validation = Validation::Form.(prepare_attributes(slug, attributes))

          if validation.success?
            projects.update_by_slug(slug, validation.output)
            Dry::Monads::Right(projects.by_slug!(validation.output.fetch(:slug) { slug }))
          else
            Dry::Monads::Left(validation)
          end
        end

        private

        def prepare_attributes(slug, attributes)
          attributes.merge(
            previous_slug: slug
          )
        end
      end
    end
  end
end
