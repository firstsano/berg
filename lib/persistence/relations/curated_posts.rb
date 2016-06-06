module Persistence
  module Relations
    class CuratedPosts < ROM::Relation[:sql]
      schema(:curated_posts) do
        attribute :id, Types::Serial
        attribute :title, Types::String
        attribute :website_url, Types::String
        attribute :image_url, Types::String
        attribute :image_upload, Types::JSON
        attribute :status, Types::String
        attribute :published_at, Types::Time
      end

      use :pagination
      per_page 20

      def by_id(id)
        where(id: id)
      end

      def published
        where(status: "published")
      end
    end
  end
end
