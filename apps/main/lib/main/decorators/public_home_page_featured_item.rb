require "berg/decorator"

module Main
  module Decorators
    class PublicHomePageFeaturedItem < Berg::Decorator
      def cover_image_url
        cover_image["original_url"]
      end
    end
  end
end
