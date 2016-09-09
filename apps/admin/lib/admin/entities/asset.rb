require "types"

module Admin
  module Entities
    class Asset < Dry::Struct
      # Assets are often loaded from JSON columns in other tables, which means
      # their keys are strings. Use a symbolized constructor here to make sure
      # we can find the keys we need to initialize a valid object.
      constructor_type :symbolized

      attribute :file_name, Types::Strict::String
      attribute :thumbnail_url, Types::Strict::String
      attribute :path, Types::Strict::String
      attribute :content_type, Types::Strict::String
      attribute :geometry, Types::Strict::String
      attribute :bytes, Types::Strict::String
    end
  end
end
