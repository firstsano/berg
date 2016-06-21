module Persistence
  module Commands
    class UpdateHomePageFeaturedItems < ROM::Commands::Update[:sql]
      relation :home_page_featured_items
      register_as :update
      result :many

      def execute(tuple)
        if tuple[:home_page_featured_items]
          relation.delete

          home_page_featured_items_tuples = tuple[:home_page_featured_items].each_with_index.map do |item, position|
            {
              position: position,
              title: item[:title],
              teaser: item[:teaser],
              url: item[:url],
              cover_image: item[:cover_image].to_json,
              highlight_color: item[:highlight_color]
            }
          end

          relation.multi_insert(home_page_featured_items_tuples)
        end
      end
    end
  end
end
