Berg::Container.boot(:attache) do |berg|
  start do
    require "berg/attache_presets"
    require "berg/attache_url_builder"

    builder = Berg::AttacheURLBuilder.new(
      berg.settings.attache_downloads_base_url, berg.settings.attache_secret_key
    )

    presets = Berg::AttachePresets.new(builder)

    # presets.define :content_medium, [:resize, "200x200"]
    # presets.define :content_large, [:resize, "400x400"]

    register "builder", builder
    register "presets", presets
  end
end
