require "types"
require "berg/entity"

module Main
  module Entities
    class Post < Berg::Entity
      attribute :color, Types::PostHighlightColor
    end
  end
end
