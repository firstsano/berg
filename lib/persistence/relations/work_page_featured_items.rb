module Persistence
  module Relations
    class WorkPageFeaturedItems < ROM::Relation[:sql]
      schema(:work_page_featured_items) do
        attribute :id, Types::Serial
        attribute :position, Types::Strict::Int
        attribute :title, Types::Strict::String
        attribute :teaser, Types::Strict::String
        attribute :url, Types::Strict::String
        attribute :cover_image, Types::JSON
        attribute :highlight_color, Types::Strict::String
      end
    end
  end
end
