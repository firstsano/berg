require "types"

module Admin
  module Entities
    class CuratedPost < Dry::Struct::Value
      constructor_type(:permissive)

      attribute :id, Types::Strict::Int
      attribute :title, Types::Strict::String.optional
      attribute :body, Types::Strict::String.optional
      attribute :link_url, Types::Strict::String
      attribute :link_title, Types::Strict::String
      attribute :image_url, Types::Strict::String.optional
      attribute :image_upload, Types::Coercible::Hash.optional
      attribute :status, Types::PostStatus
      attribute :published_at, Types::Strict::Time.optional

      def deleted?
        status == "deleted"
      end

      def published?
        status == "published"
      end
    end
  end
end
