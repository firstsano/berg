ROM::SQL.migration do
  up do
    drop_column :people, :email
  end

  down do
    add_column :people, :email, String, null: false
  end
end
