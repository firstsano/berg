require "types"

module Main
  module Entities
    class HomePageFeaturedItem < Dry::Types::Value
      attribute :id, Types::Strict::Int
      attribute :position, Types::Strict::Int
      attribute :title, Types::Strict::String
      attribute :description, Types::Strict::String
      attribute :url, Types::Strict::String
      attribute :cover_image, Types::Hash
      attribute :highlight_color, Types::Strict::String

      def cover_image_url(size = "original")
        attache_url_for(cover_image["path"], size.to_s) if cover_image
      end

      def attache_url_for(file_path, geometry)
        prefix, basename = File.split(file_path)
        [Berg::Container["config"].attache_downloads_base_url, "view", prefix, CGI.escape(geometry), CGI.escape(basename)].join('/')
      end
    end
  end
end
