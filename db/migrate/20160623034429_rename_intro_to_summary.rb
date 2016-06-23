ROM::SQL.migration do
  change do
    rename_column :projects, :intro, :summary
  end
end
