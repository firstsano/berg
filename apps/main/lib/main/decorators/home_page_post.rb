require "berg/decorator"

module Main
  module Decorators
    class HomePagePost < Berg::Decorator

      def image_url(size="original")
        if __getobj__.respond_to? :image_url
          if __getobj__.image_url
            __getobj__.image_url
          else
            uploaded_image_url(size, :image_upload)
          end
        else
          uploaded_image_url(size, :cover_image)
        end
      end

      def teaser
        __getobj__.teaser if __getobj__.respond_to? :teaser
      end

      private

      def uploaded_image_url(size="original", field_name)
        if __getobj__.respond_to?(field_name) && __getobj__.send(field_name)
          attache_url_for(__getobj__.send(field_name)["path"], size.to_s)
        end
      end

      def attache_url_for(file_path, geometry)
        prefix, basename = File.split(file_path)
        [Berg::Container["config"].attache_downloads_base_url, "view", prefix, CGI.escape(geometry), CGI.escape(basename)].join('/')
      end
    end
  end
end
