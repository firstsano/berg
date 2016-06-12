require_relative "container"

module Main
  Import = Main::Container.injector.args

  def self.Import(*args)
    Import[*args]
  end
end
