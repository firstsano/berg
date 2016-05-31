ROM::SQL.migration do
  up do
    add_column :users, :name, String, null: false, default: ""

    run <<-SQL
      UPDATE users SET name = CONCAT(first_name, ' ', last_name);
    SQL

    drop_column :users, :first_name
    drop_column :users, :last_name
  end

  down do
    add_column :users, :first_name, String, null: false, default: ""
    add_column :users, :last_name, String, null: false, default: ""

    drop_column :users, :name
  end
end
