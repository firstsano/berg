module Admin
  module Decorators
    class ExternalPost < SimpleDelegator
      def published_date
        published_at.strftime("%e %b %Y %H:%M:%S%p")
      end

      def thumbnail_image_url
        if image_upload && !image_url
          attache_url_for(image_upload["path"], "64")
        else
          image_url
        end
      end

      def status_class
        case status
        when "draft"
          "ghost"
        when "deleted"
          "warning"
        when "published"
          "success"
        end
      end

      def status_label
        status.capitalize
      end

      private

      def attache_url_for(file_path, geometry)
        prefix, basename = File.split(file_path)
        [Berg::Container["config"].attache_downloads_base_url, "view", prefix, CGI.escape(geometry), CGI.escape(basename)].join('/')
      end
    end
  end
end
