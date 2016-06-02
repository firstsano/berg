module Persistence
  module Relations
    class Posts < ROM::Relation[:sql]
      schema(:posts) do
        attribute :id, Types::Serial
        attribute :title, Types::String
        attribute :teaser, Types::String
        attribute :body, Types::String
        attribute :cover_image, Types::JSON
        attribute :slug, Types::String
        attribute :color, Types::String
        attribute :status, Types::String
        attribute :person_id, Types::ForeignKey(:people)
        attribute :published_at, Types::Time

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
