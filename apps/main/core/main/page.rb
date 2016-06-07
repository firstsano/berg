require "berg/page"

module Main
  class Page < Berg::Page
    def nav_link_for(label, path, options={})
      active_class = "nav-main__anchor--active" if current_path.split("/").include?(path.gsub("/",""))
      "<a class='#{options[:class]} #{active_class}' href='#{path}'>#{label}</a>"
    end
  end
end
