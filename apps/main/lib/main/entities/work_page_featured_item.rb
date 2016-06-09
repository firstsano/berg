require "types"

module Main
  module Entities
    class WorkPageFeaturedItem < Dry::Types::Value
      attribute :id, Types::Strict::Int
      attribute :position, Types::Strict::Int
      attribute :title, Types::Strict::String
      attribute :url, Types::Strict::String
      attribute :cover_image, Types::Hash

      def cover_image_url
        attache_url_for(cover_image["path"], "128") if cover_image
      end

      def attache_url_for(file_path, geometry)
        prefix, basename = File.split(file_path)
        [Berg::Container["config"].attache_downloads_base_url, "view", prefix, CGI.escape(geometry), CGI.escape(basename)].join('/')
      end
    end
  end
end
