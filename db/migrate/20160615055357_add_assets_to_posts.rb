ROM::SQL.migration do
  up do
    add_column :posts, :assets, :json, default: nil, null: true
  end

  down do
    drop_column :posts, :assets
  end
end
