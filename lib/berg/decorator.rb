module Berg
  class Decorator < SimpleDelegator
    def self.decorate(object)
      if object.respond_to?(:to_a)
        object.to_a.map{ |obj| new(obj) }
      else
        new(object)
      end
    end

    private

    def attache_url_for(file_path, geometry)
      prefix, basename = File.split(file_path)
      [Berg::Container["config"].attache_downloads_base_url, "view", prefix, CGI.escape(geometry), CGI.escape(basename)].join('/')
    end
  end
end
