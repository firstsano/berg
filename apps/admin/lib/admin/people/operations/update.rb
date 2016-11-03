require "admin/import"
require "admin/people/validation/form"
require "berg/matcher"

module Admin
  module People
    module Operations
      class Update
        include Admin::Import["persistence.repositories.people"]

        include Berg::Matcher

        def call(slug, attributes)
          validation = Validation::Form.(prepare_attributes(slug, attributes))

          if validation.success?
            people.update(slug, validation.output)
            Dry::Monads::Right(people.by_slug(validation.output.fetch(:slug) { slug }))
          else
            Dry::Monads::Left(validation)
          end
        end

        private

        def prepare_attributes(slug, attributes)
          attributes.merge(
            avatar_image: attributes["avatar_image"],
            previous_slug: slug
          )
        end
      end
    end
  end
end
