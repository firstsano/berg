ROM::SQL.migration do
  up do
    drop_column :projects, :tags
  end

  down do
    add_column :projects, :tags, String, null: false
  end
end
