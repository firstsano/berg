require "berg/decorator"
require "redcarpet"
require "main/renderers/standard_renderer"

module Main
  module Decorators
    class PublicPerson < Berg::Decorator
      def avatar_url(size = "original")
        return if !avatar_image

        if size == "original"
          attache_url_builder.original_url(avatar_image["path"])
        else
          attache_url_builder.url(avatar_image["path"], [:resize, size.to_s])
        end
      end

      def bio_html
        to_html(bio)
      end

      def short_bio_html
        to_html(short_bio)
      end

      private

      def to_html(input)
        renderer = Redcarpet::Markdown.new(StandardRenderer, footnotes: true, hard_wrap: true, fenced_code_blocks: true, tables: true, no_intra_emphasis: true)
        renderer.render(input)
      end
    end
  end
end
