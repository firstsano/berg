ROM::SQL.migration do
  up do
    add_column :people, :city, String, null: false
  end

  down do
    drop_column :people, :city
  end
end
