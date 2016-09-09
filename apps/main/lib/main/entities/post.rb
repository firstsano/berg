require "types"
require "main/entities/person"
require "main/entities/category"

module Main
  module Entities
    class Post < Dry::Struct
      attribute :id, Types::Strict::Int
      attribute :title, Types::Strict::String
      attribute :body, Types::Strict::String
      attribute :cover_image, Types::Hash
      attribute :teaser, Types::Strict::String
      attribute :slug, Types::Strict::String
      attribute :status, Types::PostStatus
      attribute :person_id, Types::Strict::Int
      attribute :published_at, Types::Strict::Time
      attribute :updated_at, Types::Strict::Time
      attribute :color, Types::PostHighlightColor
      attribute :assets, Types::Hash

      class WithAuthor < Post
        attribute :author, Entities::Person
      end

      class WithAuthorAndCategories < Post
        attribute :author, Entities::Person
        attribute :categories, Types::Strict::Array.member(Entities::Category)
      end
    end
  end
end
