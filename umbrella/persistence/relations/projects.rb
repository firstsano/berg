module Persistence
  module Relations
    class Projects < ROM::Relation[:sql]
      schema(:projects) do
        attribute :id, Types::Serial
        attribute :title, Types::Strict::String
        attribute :client, Types::Strict::String
        attribute :url, Types::Strict::String.optional
        attribute :intro, Types::Strict::String
        attribute :summary, Types::Strict::String
        attribute :body, Types::String.optional
        attribute :slug, Types::Strict::String
        attribute :color, Types::Strict::String
        attribute :status, Types::Strict::String
        attribute :published_at, Types::Time.optional
        attribute :case_study, Types::Strict::Bool
        attribute :cover_image, Types::JSON
        attribute :assets, Types::JSON
      end

      use :pagination

      def by_id(id)
        where(id: id)
      end

      def by_slug(slug)
        where(slug: slug)
      end

      def matching_slugs(slug)
        select(:slug).by_slug(slug)
      end

      def published
        where(status: "published")
      end
    end
  end
end
