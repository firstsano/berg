Umbrella::Container.finalize :assets do |container|
  uses :config

  require "berg/assets"

  container.register "assets", Berg::Assets.new(
    root: Pathname(container.root).join("..").realpath,
    precompiled: container["config"].precompiled_assets,
    precompiled_host: container["config"].precompiled_assets_host,
    server_link_url: container["config"].assets_server_link_url,
    server_read_url: container["config"].assets_server_read_url,
  )
end
