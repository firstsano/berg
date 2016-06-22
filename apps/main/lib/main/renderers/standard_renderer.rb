require "json"
require "redcarpet"
require "rouge"
require "rouge/plugins/redcarpet"

class StandardRenderer < Redcarpet::Render::HTML
  include Redcarpet::Render::SmartyPants
  include Rouge::Plugins::Redcarpet

  ALIGN_MAP = {
    center:  {
      geometry: "800",
      class_name: "",
    },
    left:  {
      geometry: "400",
      class_name: "figure--align-left",
    },
    right: {
      geometry: "400",
      class_name: "figure--align-right",
    }
  }

  DEFAULT_ATTRS = {}
  # FIXME this is to make sure the accessor is consistently a string
  DEFAULT_ATTRS["align"] = "center"

  # Input syntax:
  #
  # ![this is some alt text{"align":"left","geometry":"800","caption":"Foo bar caption"}](http://example.com/image.jpg)
  #
  # Options available are:
  #
  # {
  #   align: "left/right/center*",
  #   caption: "",
  #   geometry: "", An imagemagick compatible string
  #   class_name: "", Will be appended to any defaults
  # }

  def image(link, title = nil, alt_text = nil)
    alt_text, attributes = parse_attributes_from(alt_text)
    if attributes['rich']
      render_rich_figure link, title, alt_text, DEFAULT_ATTRS.merge(attributes)
    else
      render_figure link, title, alt_text, DEFAULT_ATTRS.merge(attributes)
    end
  end

  private

  def parse_attributes_from(alt_text)
    object_regex = /(.+)(\{.+\})/
    matches = alt_text.match(object_regex)
    if matches
      [matches[1], JSON.parse(matches[2])]
    else
      [alt_text, {}]
    end
  end

  def resize_image(link, geometry)
    if geometry
      link.gsub(/\/original\//, "/#{geometry.to_s}/")
    else
      link
    end
  end

  def link_with_precompiled_assets_host(link)
    precompiled_assets_host = Berg::Container["config"].precompiled_assets_host
    if precompiled_assets_host
      if link.match(/^\//)
        link = "#{precompiled_assets_host}#{link}"
      else
        matches = URI.regexp.match(link)
        if matches
          assets_uri = URI(precompiled_assets_host)
          link_uri = URI(link)
          link_uri.scheme = assets_uri.scheme
          link_uri.host = assets_uri.host
          if assets_uri.port != 80
            link_uri.port = assets_uri.port
          end
          link = link_uri.to_s
        end
      end
    end
    link
  end

  # Default renderer
  def render_figure(link, title = nil, alt_text = nil, attributes = {})
    alignment = ALIGN_MAP[attributes["align"].to_sym]
    geometry = attributes["geometry"] || alignment[:geometry]
    class_name = [attributes["class_name"], alignment[:class_name]]
    output = []
    output << "<figure class='#{class_name.join('')}'>"
    output << "<img src='#{link_with_precompiled_assets_host(resize_image(link, geometry))}' alt='#{alt_text}'>"
    if attributes["caption"]
      output << "<figcaption>#{attributes['caption']}</figcaption>"
    end
    output << "</figure>"
    output.join("")
  end

  # Rich renderer
  def render_rich_figure(link, title = nil, alt_text = nil, attributes = {})
    alignment = ALIGN_MAP[attributes["align"].to_sym]
    geometry = attributes["geometry"] || 800
    class_name = [attributes["class_name"]]
    output = []
    output << "<figure class='figure-rich clearfix #{class_name.join('')}'>"
    output << "<div class='figure-rich__text-column fl-left'>"
    output << "<h2 class='figure-rich__heading'>#{title}</h2>" if title
    output << "<figcaption>caption</figcaption>" if attributes["caption"]
    output << "</div>"
    output << "<div class='figure-rich__image-column fl-left'>"
    output << "<img src='#{link_with_precompiled_assets_host(resize_image(link, geometry))}' alt='#{alt_text}'>"
    output << "</div>"
    output << "</figure>"
    output.join("")
  end
end
