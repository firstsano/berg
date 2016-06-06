module Persistence
  module Commands
    class CreateExternalPost < ROM::Commands::Create[:sql]
      relation :external_posts
      register_as :create
      result :one
    end
  end
end
