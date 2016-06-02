ROM::SQL.migration do
  up do
    add_column :posts, :cover_image, :json, default: "{}", null: true
  end

  down do
    drop_column :posts, :cover_image, :json, default: "{}", null: true
  end
end
