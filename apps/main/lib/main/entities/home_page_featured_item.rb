require "types"
require "redcarpet"
require "main/renderers/html_without_block_elements"
require "berg/container"

module Main
  module Entities
    class HomePageFeaturedItem < Dry::Types::Struct
      attribute :id, Types::Strict::Int
      attribute :position, Types::Strict::Int
      attribute :title, Types::Strict::String
      attribute :teaser, Types::String
      attribute :url, Types::Strict::String
      attribute :cover_image, Types::Hash
      attribute :highlight_color, Types::Strict::String

      def cover_image_url
        attache_url_builder.url(cover_image["path"], [:resize, "800"]) if cover_image
      end

      def title_html
        single_line_markdown(title)
      end

      def teaser_html
        single_line_markdown(teaser)
      end

      private

      def attache_url_builder
        Berg::Container["attache.builder"]
      end

      def single_line_markdown(input)
        markdown = Redcarpet::Markdown.new(HTMLWithoutBlockElements, hard_wrap: false)
        markdown.render(input)
      end
    end
  end
end
