ROM::SQL.migration do
  change do
    alter_table(:projects) do
      set_column_allow_null :url
    end
  end
end
