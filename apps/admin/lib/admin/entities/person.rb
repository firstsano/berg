require "berg/entity"
require "types"

module Admin
  module Entities
    class Person < Berg::Entity
      attribute :avatar_image, Types::Coercible::Hash.optional
    end
  end
end
