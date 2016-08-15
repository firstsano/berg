require "admin/import"
require "admin/view"

module Admin
  module Views
    module People
      class Edit < Admin::View
        include Admin::Import[
          "persistence.repositories.people",
          "people.forms.form",
        ]

        configure do |config|
          config.template = "people/edit"
        end

        def locals(options = {})
          person = people[options[:id]]

          validation = options[:validation]

          super.merge(
            person: person,
            form: person_form(person, validation)
          )
        end

        private

        def person_form(person, validation)
          if validation
            form.build(validation, validation.messages)
          else
            form.build(person)
          end
        end
      end
    end
  end
end
