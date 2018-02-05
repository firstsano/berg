require "berg/entity"

module Main
  module Entities
    class CuratedPost < Berg::Entity
      attribute :status, Types::PostStatus
      attribute :image_upload, Types::Coercible::Hash
    end
  end
end
