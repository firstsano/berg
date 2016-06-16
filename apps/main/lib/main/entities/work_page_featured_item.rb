require "types"
require "redcarpet"

module Main
  module Entities
    class WorkPageFeaturedItem < Dry::Types::Struct
      attribute :id, Types::Strict::Int
      attribute :position, Types::Strict::Int
      attribute :title, Types::Strict::String
      attribute :teaser, Types::String
      attribute :url, Types::Strict::String
      attribute :cover_image, Types::Hash
      attribute :highlight_color, Types::Strict::String

      def cover_image_url
        attache_url_for(cover_image["path"], "128") if cover_image
      end

      def title_html
        to_html(title)
      end

      def teaser_html
        to_html(teaser)
      end

      def attache_url_for(file_path, geometry)
        prefix, basename = File.split(file_path)
        [Berg::Container["config"].attache_downloads_base_url, "view", prefix, CGI.escape(geometry), CGI.escape(basename)].join('/')
      end

      def to_html(input)
        markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, no_intra_emphasis: true)
        markdown.render(input)
      end
    end
  end
end
