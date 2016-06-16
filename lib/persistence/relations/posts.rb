module Persistence
  module Relations
    class Posts < ROM::Relation[:sql]
      schema(:posts) do
        attribute :id, Types::Serial
        attribute :title, Types::Strict::String
        attribute :teaser, Types::Strict::String
        attribute :body, Types::Strict::String
        attribute :cover_image, Types::JSON
        attribute :slug, Types::Strict::String
        attribute :color, Types::Strict::String
        attribute :status, Types::Strict::String
        attribute :person_id, Types::ForeignKey(:people)
        attribute :published_at, Types::Strict::Time.optional
        attribute :assets, Types::JSON

        associate do
          belongs :author, relation: :people
          many :categories, through: :categorisations
        end
      end

      use :pagination
      per_page 20

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

      def for_category(category_id)
        select(*columns.map {|c| :"posts__#{c}" })
          .inner_join(:categorisations, post_id: :posts__id)
          .where(category_id: category_id)
      end
    end
  end
end
