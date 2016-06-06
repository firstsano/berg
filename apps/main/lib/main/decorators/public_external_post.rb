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
    end
  end
end
