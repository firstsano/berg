require "types"
require "admin/entities/category"

module Admin
  module Entities
    class Post < Dry::Types::Value
      attribute :id, Types::Strict::Int
      attribute :title, Types::Strict::String
      attribute :teaser, Types::Strict::String
      attribute :body, Types::Strict::String
      attribute :cover_image, Types::Hash
      attribute :slug, Types::Strict::String
      attribute :status, Types::PostStatus
      attribute :person_id, Types::Strict::Int
      attribute :created_at, Types::Time
      attribute :published_at, Types::Time
      attribute :color, Types::PostHighlightColor

      def deleted?
        status == "deleted"
      end

      def published?
        status == "published"
      end
    end

    class PostWithCategories < Post
      attribute :post_categories, Types::Strict::Array.member(Admin::Entities::Category)
    end
  end
end
