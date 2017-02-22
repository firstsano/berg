require "berg/decorator"

module Admin
  module Decorators
    class CuratedPost < Berg::Decorator
      def published_date
        published_at.strftime("%e %b %Y %H:%M:%S%p")
      end

      def thumbnail_image_url
        if image_upload && !image_url
          attache_url_builder.url(image_upload["path"], [:resize, "64x64"])
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
    end
  end
end
