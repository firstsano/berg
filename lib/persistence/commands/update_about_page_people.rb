module Persistence
  module Commands
    class UpdateAboutPagePeople < ROM::Commands::Update[:sql]
      relation :about_page_people
      register_as :update
      result :many

      def execute(tuple)
        if tuple[:about_page_people]
          relation.delete

          about_page_people_tuples = tuple[:about_page_people].map.with_index { |person_id, position|
            {
              person_id: person_id,
              position: position
            }
          }

          relation.multi_insert(about_page_people_tuples)
        end
      end
    end
  end
end
