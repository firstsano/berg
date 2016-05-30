ROM::SQL.migration do
  up do
    add_column :people, :name, String, null: false, default: ""

    run <<-SQL
      UPDATE people SET name = CONCAT(first_name, ' ', last_name);
    SQL

    drop_column :people, :first_name
    drop_column :people, :last_name
  end

  down do
    add_column :people, :first_name, String, null: false, default: ""
    add_column :people, :last_name, String, null: false, default: ""

    drop_column :people, :name
  end
end
