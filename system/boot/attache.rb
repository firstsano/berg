require "berg/attache_presets"
require "berg/attache_url_builder"

Berg::Container.namespace "attache" do |container|
  builder = Berg::AttacheURLBuilder.new(
    container["config"].attache_downloads_base_url,
    container["config"].attache_secret_key,
  )

  presets = Berg::AttachePresets.new(builder)

  # presets.define :content_medium, [:resize, "200x200"]
  # presets.define :content_large, [:resize, "400x400"]

  container.register "builder", builder
  container.register "presets", presets
end
