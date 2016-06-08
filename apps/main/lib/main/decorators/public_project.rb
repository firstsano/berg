require "berg/decorator"

module Main
  module Decorators
    class PublicProject < Berg::Decorator
      def cover_image_url(size)
        attache_url_for(cover_image["path"], size.to_s) if cover_image
      end

      private

      def attache_url_for(file_path, size)
        prefix, basename = File.split(file_path)
        [Berg::Container["config"].attache_downloads_base_url, "view", prefix, CGI.escape(size), CGI.escape(basename)].join('/')
      end
    end
  end
end
