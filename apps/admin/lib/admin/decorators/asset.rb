require "pathname"
require "cgi"

module Admin
  module Decorators
    class Asset < SimpleDelegator
      def file_name
        File.basename(path)
      end

      def thumbnail_url
        attache_url_for(path, "75x75")
      end

      def original_url
        attache_url_for(path, "original")
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

      private

      def attache_url_for(file_path, geometry)
        prefix, basename = File.split(file_path)
        [Berg::Container["config"].attache_downloads_base_url, "view", prefix, CGI.escape(geometry), CGI.escape(basename)].join('/')
      end
    end
  end
end
