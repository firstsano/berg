require "berg/entity"

module Admin
  module Entities
    class Asset < Berg::Entity
      # Assets are often loaded from JSON columns in other tables, which means
      # their keys are strings. Use a symbolized constructor here to make sure
      # we can find the keys we need to initialize a valid object.
      constructor_type :symbolized
    end
  end
end
