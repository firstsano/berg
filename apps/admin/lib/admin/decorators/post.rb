require "berg/decorator"

module Admin
  module Decorators
    class Post < Berg::Decorator
      def created_date
        created_at.strftime("%e %b %Y %H:%M:%S%p")
      end

      def published_date
        published_at.strftime("%e %b %Y %H:%M:%S%p")
      end

      def status_class
        case status
        when "draft"
          "ghost"
        when "hidden"
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
