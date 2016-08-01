require "rom/sql"
require "dry-types"
require "json"

module ROM
  module SQL
    module Types
      JSON = Dry::Types::Definition.new(::JSON).constructor -> hash { hash.to_json }
    end
  end
end
