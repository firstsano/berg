require "berg/page"
require "main/import"

module Main
  class Page < Berg::Page
    include Admin::Import.hash[assets: "core.assets"]

    def nav_link_for(label, path, options = {})
      active_class = "#{options[:class]}--active" if current_path.split("/").include?(path.delete("/"))
      "<a class='#{options[:class]} #{active_class}' href='#{path}'>#{label}</a>"
    end
  end
end
