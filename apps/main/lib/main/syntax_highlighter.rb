require "redcarpet"
require "rouge"
require "rouge/plugins/redcarpet"

class HTMLWithRouge < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet
end
