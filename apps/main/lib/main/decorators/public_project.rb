require "berg/decorator"
require "redcarpet"

module Main
  module Decorators
    class PublicProject < Berg::Decorator
      def cover_image_url(size)
        attache_url_for(cover_image["path"], size.to_s) if cover_image
      end

      def body_html
        to_html(body)
      end

      private

      def attache_url_for(file_path, size)
        prefix, basename = File.split(file_path)
        [Berg::Container["config"].attache_downloads_base_url, "view", prefix, CGI.escape(size), CGI.escape(basename)].join('/')
      end

      def to_html(input)
        markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, footnotes: true, hard_wrap: true, tables: true, underline:true, no_intra_emphasis: true)
        markdown.render(input)
      end
    end
  end
end
