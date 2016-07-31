module Persistence
  module Commands
    class UpdatePost < ROM::Commands::Update[:sql]
      relation :posts
      register_as :update
      result :one

      def execute(tuple)
        result = super

        post_id = result.first[:id]
        categorisations.where(post_id: post_id).delete

        if tuple[:categories]
          categories = tuple[:categories].product([post_id])

          post_tuples = categories.map { |new_category_id, new_post_id|
            {
              category_id: new_category_id,
              post_id: new_post_id
            }
          }

          categorisations.multi_insert(post_tuples)
        end

        result
      end

      private

      def categorisations
        relation.categorisations
      end
    end
  end
end
