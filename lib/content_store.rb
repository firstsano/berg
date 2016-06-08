class ContentStore
  def initialize
    @content = {}
  end

  def capture(key, value=nil, &block)
    if block
      @content[key] = yield
    else
      @content[key] = value
    end
  end

  def [](key, value = nil, &block)
    @content[key]
  end
end
