require "berg/decorator"
require "redcarpet"
require "main/renderers/standard_renderer"
require "main/renderers/html_without_block_elements"

module Main
  module Decorators
    class PublicPost < Berg::Decorator
      def published_date
        published_at.strftime('%d %b %Y')
      end

      def author
        @author ||= Decorators::PublicPerson.decorate(__getobj__.author)
      end

      def title_html
        single_line_markdown(title)
      end

      def teaser_html
        to_html(teaser)
      end

      def body_html
        to_html(body)
      end

      def url
        "/notes/#{slug}"
      end

      def content
        content = ""
        content += "<li data-test-color='#{color}'>"
        content += "<a href='#{url}'>"
        content += "<h3>#{title}</h3>"
        content += "</a>"

        content += "<p>#{teaser}</p>"
        if cover_image_url
          content += "<img src='#{cover_image_url}' title='#{title}'/>"
        end
        content += "</li>"
      end

      def link_url;end
      def link_title;end

      def cover_image_url
        attache_url_for(cover_image["path"], "260") if cover_image
      end

      def type
        "note"
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

      def single_line_markdown(input)
        renderer = Redcarpet::Markdown.new(HTMLWithoutBlockElements, hard_wrap: false)
        renderer.render(input)
      end
    end
  end
end
