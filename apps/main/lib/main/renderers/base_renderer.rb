require "redcarpet"
require "rouge"
require "rouge/plugins/redcarpet"

class BaseRenderer < Redcarpet::Render::HTML
  include Redcarpet::Render::SmartyPants
  include Rouge::Plugins::Redcarpet

  def image(link, title = nil, alt_text = nil)
    parse_image_link(link)

    "<figure>
      <img src=\"#{@url}\" alt=\"#{@alt_text}\" class=\"#{@class}\">
      <div>
        <figurecaption>#{@caption}</figurecaption>
      </div>
    </figure>"
  end

  def parse_image_link(link)
    matches = link.match(/^(.*?)\|(.*?)\|(.*?)\|(.*)/)

    @url = matches[1]
    @alt_text = matches[2]
    @class = matches[3]
    @caption = matches[4]
  end
end
