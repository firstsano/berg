ROM::SQL.migration do
  up do
    add_column :people, :slug, String, null: true, default: ""
    run <<-SQL
      UPDATE people SET slug = LOWER(REPLACE(name, ' ', '-'));
      ALTER TABLE people ADD UNIQUE (slug);
    SQL
  end

  down do
    drop_column :people, :slug
  end
end
