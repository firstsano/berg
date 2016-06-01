module Main
  class Application < Dry::Web::Application
    route "about" do |r|
      r.view "pages.about"
    end

    route "contact" do |r|
      r.view "pages.contact"
    end

    route "work" do |r|
      r.view "pages.work"
    end
  end
end
