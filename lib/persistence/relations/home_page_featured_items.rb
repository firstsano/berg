module Persistence
  module Relations
    class HomePageFeaturedItems < ROM::Relation[:sql]
      schema(:home_page_featured_items) do
        attribute :id, Types::Serial
        attribute :position, Types::Strict::Int
        attribute :title, Types::Strict::String
        attribute :url, Types::Strict::String
        attribute :cover_image, Types::JSON
        attribute :highlight_color, Types::Strict::String
      end
    end
  end
end
