require "types"
require "berg/entity"

module Admin
  module Entities
    class CuratedPost < Berg::Entity
      attribute :image_upload, Types::Coercible::Hash.optional
      attribute :status, Types::PostStatus

      def deleted?
        status == "deleted"
      end

      def published?
        status == "published"
      end
    end
  end
end
