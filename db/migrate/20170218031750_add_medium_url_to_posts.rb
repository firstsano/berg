ROM::SQL.migration do
  change do
    add_column :posts, :medium_url, String, null: true
  end
end
