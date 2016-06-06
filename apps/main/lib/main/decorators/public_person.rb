require "berg/decorator"

module Main
  module Decorators
    class PublicPerson < Berg::Decorator
      def avatar_url(size="original")
        attache_url_for(avatar_image["path"], size.to_s) if avatar_image
      end
    end
  end
end
