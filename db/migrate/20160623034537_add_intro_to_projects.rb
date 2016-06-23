ROM::SQL.migration do
  up do
    add_column :projects, :intro, String, null: true
  end

  down do
    drop_column :projects, :intro
  end
end
