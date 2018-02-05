require "types"
require "berg/entity"

module Main
  module Entities
    class Project < Berg::Entity
      attribute :status, Types::ProjectStatus
      attribute :color, Types::PostHighlightColor
    end
  end
end
