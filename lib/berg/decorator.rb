require "berg/container"

module Berg
  class Decorator < SimpleDelegator
    def self.decorate(object)
      if object.respond_to?(:to_a)
        object.to_a.map { |obj| new(obj) }
      else
        new(object)
      end
    end

    private

    def attache_url_builder
      Berg::Container["attache.builder"]
    end

    def replace_attache_urls(str)
      str.gsub(/#{Berg::Container["config"].attache_uploads_base_url}/, Berg::Container["config"].attache_downloads_base_url)
    end
  end
end
