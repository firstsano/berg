require "berg/decorator"
require "redcarpet"

module Main
  module Decorators
    class PublicCuratedPost < Berg::Decorator
      def image_url(size="original")
        if image_upload && !__getobj__.image_url
          attache_url_for(image_upload["path"], size.to_s)
        else
          __getobj__.image_url
        end
      end

      def url
        link_url
      end

      def body_html
        to_html(body)
      end

      def color;end
      def teaser;end

      private

      def to_html(input)
        markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, hard_wrap: true)
        markdown.render(input)
      end
    end
  end
end
