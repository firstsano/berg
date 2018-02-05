require "types"
require "berg/entity"

module Admin
  module Entities
    class Post < Berg::Entity
      attribute :cover_image, Types::Coercible::Hash.optional
      attribute :status, Types::PostStatus
      attribute :color, Types::PostHighlightColor

      def published?
        status == "published"
      end
    end
  end
end
