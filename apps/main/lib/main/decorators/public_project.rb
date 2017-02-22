require "berg/decorator"
require "redcarpet"
require "main/renderers/standard_renderer"
require "main/renderers/html_without_block_elements"

module Main
  module Decorators
    class PublicProject < Berg::Decorator
      def cover_image_url
        attache_url_builder.url(cover_image["path"], [:resize, "400"]) if cover_image
      end

      def title_html
        single_line_markdown(title)
      end

      def intro_html
        to_html(intro) if intro
      end

      def summary_html
        to_html(summary)
      end

      def body_html
        to_html(body)
      end

      private

      def to_html(input)
        renderer = Redcarpet::Markdown.new(StandardRenderer, footnotes: true, hard_wrap: true, tables: true, no_intra_emphasis: true)
        replace_attache_urls(renderer.render(input))
      end

      def single_line_markdown(input)
        renderer = Redcarpet::Markdown.new(HTMLWithoutBlockElements, hard_wrap: false)
        renderer.render(input)
      end
    end
  end
end
