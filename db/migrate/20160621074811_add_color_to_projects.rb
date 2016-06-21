ROM::SQL.migration do
  up do
    add_column :projects, :color, String, null: false, default: ""
  end

  down do
    drop_column :projects, :color
  end
end
