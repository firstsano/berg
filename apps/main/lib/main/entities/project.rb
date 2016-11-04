require "types"

module Main
  module Entities
    class Project < Types::Struct
      attribute :id, Types::Strict::Int
      attribute :title, Types::Strict::String
      attribute :client, Types::Strict::String
      attribute :url, Types::Strict::String.optional
      attribute :intro, Types::Strict::String.optional
      attribute :summary, Types::Strict::String
      attribute :body, Types::Strict::String
      attribute :slug, Types::Strict::String
      attribute :status, Types::ProjectStatus
      attribute :published_at, Types::Strict::Time.optional
      attribute :case_study, Types::Strict::Bool
      attribute :cover_image, Types::Hash
      attribute :color, Types::PostHighlightColor
      attribute :assets, Types::Hash
    end
  end
end
