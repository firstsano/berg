ROM::SQL.migration do
  up do
    add_column :projects, :cover_image, :json, default: "{}", null: true
  end

  down do
    drop_column :projects, :cover_image
  end
end
