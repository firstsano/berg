require "dry-types"
require "dry-struct"

module Types
  include Dry::Types.module

  PostHighlightColor = Types::Strict::String.enum("red", "green", "blue", "grey")
  PostStatus = Types::Strict::String.default("draft").enum("draft", "published", "hidden")
  ProjectStatus = Types::Strict::String.default("draft").enum("draft", "published", "hidden")

  class Struct < Dry::Struct
  end
end

require "rom_sql_types"
