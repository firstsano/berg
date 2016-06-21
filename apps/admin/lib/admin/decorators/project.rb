module Admin
  module Decorators
    class Project < SimpleDelegator
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

      def published_date
        published_at.strftime("%e %b %Y %H:%M:%S%p")
      end
    end
  end
end
