require "types"
require "berg/entity"

module Admin
  module Entities
    class Project < Berg::Entity
      attribute :status, Types::ProjectStatus
      attribute :cover_image, Types::Coercible::Hash.optional
      attribute :color, Types::PostHighlightColor

      def published?
        status == "published"
      end

      def case_study?
        case_study == true
      end
    end
  end
end
