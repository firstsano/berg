require "redcarpet"
require "rouge"
require "rouge/plugins/redcarpet"

class BaseRenderer < Redcarpet::Render::HTML
  include Redcarpet::Render::SmartyPants
  include Rouge::Plugins::Redcarpet
end
