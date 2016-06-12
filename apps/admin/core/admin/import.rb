require_relative "container"

module Admin
  Import = Admin::Container.injector.args

  def self.Import(*args)
    Import[*args]
  end
end
