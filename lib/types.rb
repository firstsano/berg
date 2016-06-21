require "dry-types"

module Types
  include Dry::Types.module

  PostHighlightColor = Types::Strict::String.enum("red", "green", "blue", "grey")
  PostStatus = Types::Strict::String.default("draft").enum("draft", "published", "deleted")
  ProjectStatus = Types::Strict::String.default("draft").enum("draft", "published", "hidden")
end

require "rom_sql_types"
