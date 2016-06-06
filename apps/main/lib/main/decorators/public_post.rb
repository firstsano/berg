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

      def image_url(size="original")
        # TODO: Uncomment me when we merge #37
        # attache_url_for(cover_image["path"], size.to_s) if cover_image
      end

      def url
        "/notes/#{slug}"
      end

      private

      def to_html(input)
        markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, footnotes: true, hard_wrap: true)
        markdown.render(input)
      end
    end
  end
end
