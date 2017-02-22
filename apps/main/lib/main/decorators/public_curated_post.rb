require "berg/decorator"
require "redcarpet"

module Main
  module Decorators
    class PublicCuratedPost < Berg::Decorator
      def image_url(size = "original")
        if image_upload && !__getobj__.image_url
          if size == "original"
            attache_url_builder.original_url(image_upload["path"])
          else
            attache_url_builder.url(image_upload["path"], [:resize, size.to_s])
          end
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

      def content
        content = ""
        content += "<li>"
        content += "<a href='#{url}'>"
        content += "<h3>#{title}</h3>"
        content += "</a>"

        if image_url
          content += "<img src='#{image_url(300)}' title='#{title}'/>"
        end

        if body
          content += body_html
        end

        content + "</li>"
      end

      def color; end

      def teaser; end

      def type
        "curated"
      end

      private

      def to_html(input)
        markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, hard_wrap: true)
        markdown.render(input)
      end
    end
  end
end
