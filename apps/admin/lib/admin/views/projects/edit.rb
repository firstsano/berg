require "admin/import"
require "admin/view"
require "admin/projects/forms/edit_form"
require "admin/decorators/asset"

module Admin
  module Views
    module Projects
      class Edit < Admin::View
        include Admin::Import(
          "admin.persistence.repositories.projects",
          "admin.projects.forms.edit_form"
        )

        configure do |config|
          config.template = "projects/edit"
        end

        def locals(options = {})
          project = projects.by_slug(options.fetch(:slug))

          validation = options[:validation]

          super.merge(
            project: project,
            project_form: project_form(project, validation)
          )
        end

        private

        def project_form(project, validation)
          if validation
            edit_form.build(validation, validation.messages)
          else
            edit_form.build(form_input(project))
          end
        end

        def form_input(project)
          assets = Decorators::Asset.decorate(project.assets).map(&:to_input_h)

          project.to_h.merge(
            assets: assets
          )
        end
      end
    end
  end
end
