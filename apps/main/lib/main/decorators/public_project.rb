require "berg/decorator"
require "redcarpet"

module Main
  module Decorators
    class PublicProject < Berg::Decorator
      def cover_image_url
        attache_url_for(cover_image["path"], "128") if cover_image
      end

      def body_html
        to_html(body)
      end

      private

      def attache_url_for(file_path, geometry)
        prefix, basename = File.split(file_path)
        [Berg::Container.settings.attache_downloads_base_url, "view", prefix, CGI.escape(geometry), CGI.escape(basename)].join('/')
      end

      def to_html(input)
        markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, footnotes: true, hard_wrap: true, tables: true, no_intra_emphasis: true)
        markdown.render(input)
      end
    end
  end
end
