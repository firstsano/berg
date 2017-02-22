module Berg
  class AttachePresets
    attr_reader :url_builder
    attr_reader :presets

    def initialize(url_builder, presets = {})
      @url_builder = url_builder
      @presets = presets
    end

    def define(name, *instructions)
      @presets[name] = instructions
    end

    def method_missing(name, *args)
      if presets.key?(name)
        url_builder.url(*(args + presets[name]))
      else
        super
      end
    end

    private

    def respond_to_missing?(name, _include_private = false)
      @presets.key?(name) || super
    end
  end
end
