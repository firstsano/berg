module Persistence
  module Commands
    class UpdateWorkPageFeaturedItems < ROM::Commands::Update[:sql]
      relation :work_page_featured_items
      register_as :update
      result :many

      def execute(tuple)
        if tuple[:work_page_featured_items]
          relation.delete

          work_page_featured_items_tuples = tuple[:work_page_featured_items].each_with_index.map do |item, position|
            {
              position: position,
              title: item[:title],
              url: item[:url],
              cover_image: item[:cover_image].to_json,
              highlight_color: item[:highlight_color]
            }
          end

          relation.multi_insert(work_page_featured_items_tuples)
        end
      end
    end
  end
end
