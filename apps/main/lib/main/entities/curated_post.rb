require "types"

module Main
  module Entities
    class CuratedPost < Dry::Types::Value
      attribute :id, Types::Strict::Int
      attribute :title, Types::Strict::String
      attribute :website_url, Types::Strict::String.optional
      attribute :image_url, Types::Strict::String.optional
      attribute :status, Types::PostStatus
      attribute :image_upload, Types::Form::Hash
      attribute :published_at, Types::Time
    end
  end
end
