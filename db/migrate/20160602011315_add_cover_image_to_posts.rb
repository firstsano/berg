ROM::SQL.migration do
  up do
    add_column :posts, :cover_image, :json, default: nil, null: true
  end

  down do
    drop_column :posts, :cover_image
  end
end
