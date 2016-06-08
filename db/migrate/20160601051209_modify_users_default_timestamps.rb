ROM::SQL.migration do
  change do
    alter_table(:users) do
      set_column_default :created_at, Sequel.lit("(now() at time zone 'utc')")
      set_column_default :updated_at, Sequel.lit("(now() at time zone 'utc')")
    end
  end
end
