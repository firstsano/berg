require "types"
require "redcarpet"

module Main
  module Entities
    class OfficeContactDetail < Dry::Types::Struct
      attribute :id, Types::Strict::Int
      attribute :name, Types::Strict::String
      attribute :address, Types::Strict::String
      attribute :phone_number, Types::Strict::String

      def name_html
        to_html(name)
      end

      def address_html
        to_html(address)
      end

      def phone_number_html
        to_html(phone_number)
      end

      def to_html(input)
        markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, no_intra_emphasis: true)
        markdown.render(input)
      end
    end
  end
end
