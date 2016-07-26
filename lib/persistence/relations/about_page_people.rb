module Persistence
  module Relations
    class AboutPagePeople < ROM::Relation[:sql]
      schema :about_page_people, infer: true

      # schema :about_page_people, infer: true do
      #   attribute :person_id, Types::ForeignKey(:people)
      #   attribute :position, Types::Strict::Int

      #   associations do
      #     belongs_to :person, relation: :people
      #   end
      # end
    end
  end
end
