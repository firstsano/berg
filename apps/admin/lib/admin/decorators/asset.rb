require "berg/decorator"
require "pathname"
require "cgi"

module Admin
  module Decorators
    class Asset < Berg::Decorator
      def file_name
        File.basename(path)
      end

      def thumbnail_url
        attache_url_builder.url(path, [:resize, "75x75"])
      end

      def original_url
        attache_url_builder.original_url(path)
      end

      def to_input_h
        {
          file_name: file_name,
          thumbnail_url: thumbnail_url,
          original_url: original_url,
          path: path,
          content_type: content_type,
          geometry: geometry,
          bytes: bytes
        }
      end
    end
  end
end
