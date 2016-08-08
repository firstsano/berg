require_relative "container"

module Berg
  Import = Berg::Container.injector
  HashImport = Berg::Container.injector.kwargs

  def self.Import(*args)
    Import[*args]
  end
end
