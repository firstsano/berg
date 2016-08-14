require_relative "container"

module Berg
  Import = Berg::Container.injector

  def self.Import(*args)
    Import[*args]
  end
end
