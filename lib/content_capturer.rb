class ContentCapturer
  def initialize
    @content = {}
  end

  def [](key, value = nil, &block)
    output = nil

    if block
      @content[key] = yield
    elsif value
      @content[key] = value
    else
      output = @content[key]
    end

    output
  end

  alias_method :call, :[]
end
