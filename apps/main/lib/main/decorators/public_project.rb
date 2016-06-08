require "berg/decorator"
require "redcarpet"

module Main
  module Decorators
    class PublicProject < Berg::Decorator

      def body_html
        to_html(body)
      end

      private

      def to_html(input)
        markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, footnotes: true, hard_wrap: true, tables: true, underline:true, no_intra_emphasis: true)
        markdown.render(input)
      end
    end
  end
end
