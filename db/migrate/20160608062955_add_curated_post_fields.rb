ROM::SQL.migration do
  change do
    rename_column :curated_posts, :website_url, :link_url
    add_column :curated_posts, :link_title, String, null: false, default: ""
    add_column :curated_posts, :body, String, null: true
  end
end
