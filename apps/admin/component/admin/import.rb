require_relative "container"

module Admin
  Import = Admin::Container.injector

  def self.Import(*args)
    Import[*args]
  end
end
