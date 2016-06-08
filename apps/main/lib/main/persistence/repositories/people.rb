require "berg/repository"
require "main/entities/person"

module Main
  module Persistence
    module Repositories
      class People < Berg::Repository[:people]
        relations :people

        def for_about_page
          people
            .for_about_page
            .as(Entities::Person)
        end

        def number_of_cities
          people
            .select(:city)
            .map { |p| p[:city] }
            .uniq
            .length
        end
      end
    end
  end
end
