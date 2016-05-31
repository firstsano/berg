class Admin::Application < Dry::Web::Application
  route "pages" do |r|
    r.authorize do
      r.on "about" do
        r.is do
          r.get do
            r.view "pages.about.edit"
          end

          r.post do
            r.resolve "admin.pages.about.operations.update" do |update_about_page|
              update_about_page.(r[:page]) do |m|
                m.success do
                  flash[:notice] = t["admin.pages.page_update"]
                  r.redirect "/admin"
                end

                m.failure do |validation|
                  r.view "pages.about.edit", validation: validation
                end
              end
            end
          end
        end
      end

      r.on "home" do
        r.is do
          r.get do
            r.view "pages.home.edit"
          end

          r.post do
            r.resolve "admin.pages.home.operations.update" do |update_home_page|
              update_home_page.(r[:page]) do |m|
                m.success do
                  flash[:notice] = t["admin.pages.page_updated"]
                  r.redirect "/admin"
                end

                m.failure do |validation|
                  r.view "pages.home.edit", validation: validation
                end
              end
            end
          end
        end
      end
    end

    r.on "work" do
      r.is do
        r.get do
          r.view "pages.work.edit"
        end

        r.post do
          r.resolve "admin.pages.work.operations.update" do |update_work_page|
            update_work_page.(r[:page]) do |m|
              m.success do
                flash[:notice] = t["admin.pages.page_updated"]
                r.redirect "/admin"
              end

              m.failure do |validation|
                r.view "pages.work.edit", validation: validation
              end
            end
          end
        end
      end
    end
  end
end
