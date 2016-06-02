require "berg/decorator"

module Main
  module Decorators
    class PublicProject < Berg::Decorator
      def cover_image_url(size = "original")
        attache_url_for(cover_image["path"], size.to_s) if cover_image
      end

      def attache_url_for(file_path, geometry)
        prefix, basename = File.split(file_path)
        [Berg::Container["config"].attache_downloads_base_url, "view", prefix, CGI.escape(geometry), CGI.escape(basename)].join('/')
      end
    end
  end
end
