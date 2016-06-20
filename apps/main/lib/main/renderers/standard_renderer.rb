require "redcarpet"
require "rouge"
require "rouge/plugins/redcarpet"

class StandardRenderer < Redcarpet::Render::HTML
  include Redcarpet::Render::SmartyPants
  include Rouge::Plugins::Redcarpet

  # Input syntax:
  # ![](http://example.com/image.jpg|this is some alt text|this is the caption|left)

  # def image(link, title = nil, alt_text = nil)
  #   parse_image_link(link)
  #
  #   @translated_class =
  #     if @class == "left"
  #       'class=figure-align-left'
  #     elsif @class == "right"
  #       'class=figure-align-right'
  #     end
  #
  #   "<figure #{@translated_class}>
  #     <img src=\"#{@url}\" alt=\"#{@alt_text}\">
  #     <figcaption>#{@caption}</figcaption>
  #   </figure>"
  # end
  #
  # def parse_image_link(link)
  #   matches = link.match(/^(.*?)\|(.*?)\|(.*?)\|(.*)/)
  #
  #   @url = matches[1]
  #   @alt_text = matches[2]
  #   @caption = matches[3]
  #   @class = matches[4]
  # end
end
