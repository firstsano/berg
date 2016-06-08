require "berg/decorator"
require "redcarpet"

module Main
  module Decorators
    class PublicPost < Berg::Decorator
      def published_date
        published_at.strftime('%d %b %Y')
      end

      def author
        @auhor ||= Decorators::PublicPerson.decorate(__getobj__.author)
      end

      def body_html
        to_html(body)
      end

      def cover_image_url
        attache_url_for(cover_image["path"], "128") if cover_image
      end

      private

      def attache_url_for(file_path, geometry)
        prefix, basename = File.split(file_path)
        [Berg::Container["config"].attache_downloads_base_url, "view", prefix, CGI.escape(geometry), CGI.escape(basename)].join('/')
      end

      def to_html(input)
        markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, footnotes: true, hard_wrap: true, fenced_code_blocks: true, tables: true, underline:true, no_intra_emphasis: true)
        markdown.render(input)
      end
    end
  end
end
