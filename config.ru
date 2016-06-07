require "rack/rewrite"
require_relative "core/boot"

use Rack::Rewrite do
  # add rewrite rules here
  r301 %r{/articles(.*)}, "/notes$1"
end

run Berg::Application.freeze.app
