require "berg/page"

module Main
  class Page < Berg::Page
    def nav_link_for(label, path, options={})
      active_class = "#{options[:class]}--active" if current_path.split("/").include?(path.gsub("/",""))
      "<a class='#{options[:class]} #{active_class}' href='#{path}'>#{label}</a>"
    end

    def content_for(key, value = nil, &block)
      puts [key,value].inspect
      output = nil

      if block
        @content[key] = yield
      elsif value
        @content[key] = value
      else
        output = @content[key]
      end

      output
    end
  end
end
