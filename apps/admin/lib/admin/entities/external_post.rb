require "types"

module Admin
  module Entities
    class ExternalPost < Dry::Types::Value
      attribute :id, Types::Strict::Int
      attribute :title, Types::Strict::String
      attribute :website_url, Types::Strict::String.optional
      attribute :image_url, Types::Strict::String.optional
      attribute :status, Types::PostStatus
      attribute :image_upload, Types::Form::Hash
      attribute :published_at, Types::Time

      def deleted?
        status == "deleted"
      end

      def published?
        status == "published"
      end
    end
  end
end
