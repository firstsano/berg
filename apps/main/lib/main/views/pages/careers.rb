require "main/view"

module Main
  module Views
    module Pages
      class Careers < Main::View
        configure do |config|
          config.template = "pages/careers"
        end
      end
    end
  end
end
