module Persistence
  module Commands
    class CreateCuratedPost < ROM::Commands::Create[:sql]
      relation :curated_posts
      register_as :create
      result :one
    end
  end
end
