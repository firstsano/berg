module Persistence
  module Relations
    class People < ROM::Relation[:sql]
      schema(:people) do
        attribute :id, Types::Serial
        attribute :name, Types::Strict::String
        attribute :email, Types::Strict::String
        attribute :bio, Types::Strict::String
        attribute :short_bio, Types::Strict::String
        attribute :twitter_handle, Types::Strict::String.optional
        attribute :website_url, Types::Strict::String.optional
        attribute :avatar_image, Types::JSON
        attribute :job_title, Types::Strict::String.optional
        attribute :city, Types::Strict::String
      end

      use :pagination
      per_page 20

      def by_id(id)
        where(id: id)
      end

      def by_email(email)
        where(email: email)
      end

      def for_about_page
        select
          .inner_join(
            :about_page_people,
            person_id: :id)
          .order(:position)
      end
    end
  end
end
