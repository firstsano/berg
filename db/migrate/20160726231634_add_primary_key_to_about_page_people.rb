ROM::SQL.migration do
  change do
    alter_table :about_page_people do
      add_primary_key [:person_id, :position]
    end
  end
end
