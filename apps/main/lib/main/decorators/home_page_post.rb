require "berg/decorator"

module Main
  module Decorators
    class HomePagePost < Berg::Decorator
      def color
        __getobj__.color if __getobj__.respond_to? :color
      end

      def image_url(size="original")
        __getobj__.image_url(size)
      end

      def teaser
        __getobj__.teaser if __getobj__.respond_to? :teaser
      end
    end
  end
end
