require "types"
require "redcarpet"
require "main/renderers/standard_renderer"
require "main/renderers/html_without_block_elements"

module Main
  module Entities
    class OfficeContactDetail < Types::Struct
      attribute :id, Types::Strict::Int
      attribute :name, Types::Strict::String
      attribute :address, Types::Strict::String
      attribute :phone_number, Types::Strict::String
      attribute :latitude, Types::Strict::String
      attribute :longitude, Types::Strict::String

      def name_html
        single_line_markdown(name)
      end

      def address_html
        to_html(address)
      end

      def phone_number_html
        single_line_markdown(phone_number)
      end

      def to_html(input)
        renderer = Redcarpet::Markdown.new(StandardRenderer, footnotes: true, hard_wrap: true, fenced_code_blocks: true, tables: true, no_intra_emphasis: true)
        renderer.render(input)
      end

      def single_line_markdown(input)
        markdown = Redcarpet::Markdown.new(HTMLWithoutBlockElements, hard_wrap: false)
        markdown.render(input)
      end
    end
  end
end
