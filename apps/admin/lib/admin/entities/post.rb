require "types"
require "admin/entities/category"
require "admin/entities/asset"

module Admin
  module Entities
    class Post < Types::Struct
      attribute :id, Types::Strict::Int
      attribute :title, Types::Strict::String
      attribute :teaser, Types::Strict::String
      attribute :body, Types::Strict::String
      attribute :cover_image, Types::Coercible::Hash.optional
      attribute :slug, Types::Strict::String
      attribute :status, Types::PostStatus
      attribute :person_id, Types::Strict::Int
      attribute :created_at, Types::Strict::Time
      attribute :published_at, Types::Strict::Time.optional
      attribute :color, Types::PostHighlightColor
      attribute :assets, Types::Coercible::Array.member(Admin::Entities::Asset).optional

      def published?
        status == "published"
      end
    end

    class PostWithCategories < Post
      attribute :categories, Types::Strict::Array.member(Admin::Entities::Category)
    end
  end
end
