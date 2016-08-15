class Admin::Application
  route "curated_posts" do |r|
    r.authorize do
      r.is do
        r.get do
          r.view "curated_posts.index", page: r[:page]
        end

        r.post do
          r.resolve "curated_posts.operations.create" do |create_curated_post|
            create_curated_post.(r[:curated_post]) do |m|
              m.success do
                flash[:notice] = t["admin.curated_posts.post_created"]
                r.redirect "/admin/curated_posts"
              end

              m.failure do |validation|
                r.view "curated_posts.new", validation: validation
              end
            end
          end
        end
      end

      r.get "new" do
        r.view "curated_posts.new"
      end

      r.on ":id" do |id|
        r.get "edit" do
          r.view "curated_posts.edit", id: id
        end

        r.put do
          r.resolve "curated_posts.operations.update" do |update_curated_post|
            update_curated_post.(id, r[:curated_post]) do |m|
              m.success do
                flash[:notice] = t["admin.curated_posts.post_updated"]
                r.redirect "/admin/curated_posts"
              end

              m.failure do |validation|
                r.view "curated_posts.edit", id: id, validation: validation
              end
            end
          end
        end
      end
    end
  end
end
