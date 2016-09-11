module TestHelpers
  module_function

  def container
    Umbrella::Container
  end

  def app
    Umbrella::Application.app
  end

  def rom
    container["persistence.rom"]
  end

  def db_connection
    rom.gateways[:default].connection
  end
end
