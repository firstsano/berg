ROM::SQL.migration do
  up do
    drop_column :work_page_featured_items, :description
  end

  down do
    add_column :work_page_featured_items, :description, String, null: false
  end
end
