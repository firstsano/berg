Berg::Container.boot(:persistence, namespace: true) do |berg|
  init do
    require "sequel"
    require "rom"

    Sequel.database_timezone = :utc
    Sequel.application_timezone = :local

    config = ROM::Configuration.new(
      :sql, berg.settings.database_url, extensions: [:error_sql, :pg_array, :pg_json]
    )

    register("config", config)
    register("db", config.gateways[:default].connection)
  end

  start do
    config = berg["persistence.config"]
    config.auto_registration(berg.root.join("lib/persistence"))

    register("rom", ROM.container(config))
  end
end
