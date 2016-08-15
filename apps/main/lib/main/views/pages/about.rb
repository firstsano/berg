require "main/import"
require "main/view"
require "main/decorators/public_person"

module Main
  module Views
    module Pages
      class About < Main::View
        include Main::Import("persistence.repositories.people")

        configure do |config|
          config.template = "pages/about"
        end

        def locals(options = {})
          about_page_people = people.for_about_page

          super.merge(
            people: Decorators::PublicPerson.decorate(about_page_people),
            number_of_cities: about_page_people.map { |p| p[:city] }.uniq.length
          )
        end
      end
    end
  end
end
