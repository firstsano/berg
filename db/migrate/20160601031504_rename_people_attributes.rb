ROM::SQL.migration do
  up do
    rename_column :people, :twitter, :twitter_handle
    rename_column :people, :website, :website_url
    rename_column :people, :avatar, :avatar_image
  end
end
