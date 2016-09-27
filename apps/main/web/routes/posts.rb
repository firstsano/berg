class Main::Application
  route "notes" do |r|
    r.is do
      r.view "posts.index", page: r[:page] || 1
    end

    r.on "category/:category" do |category|
      r.view "posts.category.index", category: category, page: r[:page] || 1
    end

    r.on "author/:author" do |author|
      #r.view "posts.author.index", author: author, page: r[:page] || 1
      p author
    end

    r.on ":slug" do |slug|
      r.resolve("operations.posts.check_publication_state") do |check_publication_state|
        check_publication_state.(slug) do |m|
          m.failure do
            response.status = 404
            r.view "errors.error_404"
          end

          m.success do
            r.view "posts.show", slug: slug
          end
        end
      end
    end
  end
end
