require "rack/rewrite"
require "rack/ssl"

use Rack::Rewrite do
  # if ENV["RACK_ENV"] == "production"
  #   r301 %r{.*}, "https://icelab.com.au$&", if: -> rack_env {
  #     rack_env["SERVER_NAME"] != "icelab.com.au"
  #   }
  # end

  # add additional rewrite rules here
  r301 %r{/articles(.*)}, "/notes$1"
  r301 "/services", "/work"
end

use Rack::SSL if ENV["RACK_ENV"] == "production"
use Rack::Deflater

require_relative "core/boot"
run Berg::Application.freeze.app
