ROM::SQL.migration do
  up do
    add_column :projects, :assets, :json, default: nil, null: true
  end

  down do
    drop_column :projects, :assets
  end
end
