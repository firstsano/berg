require "dry-types"

module Types
  include Dry::Types.module

  PostHighlightColor = Types::Strict::String.enum("red", "orange", "yellow","green", "blue", "indigo", "violet")
  PostStatus = Types::Strict::String.default("draft").enum("draft", "published", "deleted")
  ProjectStatus = Types::Strict::String.default("draft").enum("draft", "published", "deleted")
end

require "rom_sql_types"
