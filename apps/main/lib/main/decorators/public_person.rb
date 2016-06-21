require "berg/decorator"
require "redcarpet"
require "main/renderers/standard_renderer"

module Main
  module Decorators
    class PublicPerson < Berg::Decorator
      def avatar_url(size="original")
        attache_url_for(avatar_image["path"], size.to_s) if avatar_image
      end

      def bio_html
        to_html(bio)
      end

      def short_bio_html
        to_html(short_bio)
      end

      private

      def attache_url_for(file_path, geometry)
        prefix, basename = File.split(file_path)
        [Berg::Container["config"].attache_downloads_base_url, "view", prefix, CGI.escape(geometry), CGI.escape(basename)].join('/')
      end

      def to_html(input)
        renderer = Redcarpet::Markdown.new(StandardRenderer, footnotes: true, hard_wrap: true, fenced_code_blocks: true, tables: true, no_intra_emphasis: true)
        renderer.render(input)
      end
    end
  end
end
