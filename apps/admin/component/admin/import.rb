require_relative "container"

module Admin
  Import = Admin::Container::Inject.args

  def self.Import(*args)
    Import[*args]
  end
end
