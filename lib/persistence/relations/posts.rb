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

        associations do
          belongs_to :person, as: :author
          has_many :categories, through: :categorisations
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
        select(*columns.map { |c| :"posts__#{c}" })
          .inner_join(:categorisations, post_id: :posts__id)
          .where(category_id: category_id)
      end

      def for_person(person_id)
        select(*columns.map { |c| :"posts__#{c}" })
          .where(person_id: person_id)
      end

      def search(q)
        query = PG::Connection.escape_string(q)
        sql = <<-SQL
          SELECT id, title, teaser, body, cover_image, slug, color, status, person_id, published_at, assets, created_at, updated_at
            FROM (SELECT posts.id as id,
                   title,
                   teaser,
                   body,
                   cover_image,
                   posts.slug as slug,
                   color,
                   status,
                   person_id,
                   published_at,
                   assets,
                   posts.created_at as created_at,
                   posts.updated_at as updated_at,
                   setweight(to_tsvector(posts.title), 'A') ||
                   setweight(to_tsvector(posts.body), 'B') ||
                   setweight(to_tsvector('simple', people.name), 'C') as document
                  FROM posts
                  JOIN people ON people.id = posts.person_id
                  GROUP BY posts.id, people.id) p_search
            WHERE p_search.document @@ plainto_tsquery('english', '#{query}')
            ORDER BY ts_rank(p_search.document, plainto_tsquery('english', '#{query}')) DESC
        SQL
        __new__(dataset.with_sql(sql))
      end
    end
  end
end
