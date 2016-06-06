module Main
  module Decorators
    class PublicExternalPost < Berg::Decorator
      def image_url(size="original")
        if image_upload && !__getobj__.image_url
          attache_url_for(image_upload["path"], size.to_s)
        else
          __getobj__.image_url
        end
      end

      private

      def attache_url_for(file_path, geometry)
        prefix, basename = File.split(file_path)
        [Berg::Container["config"].attache_downloads_base_url, "view", prefix, CGI.escape(geometry), CGI.escape(basename)].join('/')
      end
    end
  end
end
