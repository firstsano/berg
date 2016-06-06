class Admin::Application < Dry::Web::Application
  route "external_posts" do |r|
    r.authorize do
      r.is do
        r.get do
          r.view "external_posts.index", page: r[:page]
        end

        r.post do
          r.resolve "admin.external_posts.operations.create" do |create_external_post|
            create_external_post.(r[:external_post]) do |m|
              m.success do
                flash[:notice] = t["admin.external_posts.post_created"]
                r.redirect "/admin/external_posts"
              end

              m.failure do |validation|
                r.view "external_posts.new", validation: validation
              end
            end
          end
        end
      end

      r.get "new" do
        r.view "external_posts.new"
      end

      r.on ":id" do |id|
        r.get "edit" do
          r.view "external_posts.edit", id: id
        end

        r.put do
          r.resolve "admin.external_posts.operations.update" do |update_external_post|
            update_external_post.(id, r[:external_post]) do |m|
              m.success do
                flash[:notice] = t["admin.external_posts.post_updated"]
                r.redirect "/admin/external_posts"
              end

              m.failure do |validation|
                r.view "external_posts.edit", id: id, validation: validation
              end
            end
          end
        end
      end
    end
  end
end
