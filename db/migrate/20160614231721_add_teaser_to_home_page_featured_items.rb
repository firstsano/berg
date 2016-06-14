ROM::SQL.migration do
  up do
    add_column :home_page_featured_items, :teaser, String, null: false
  end

  down do
    drop_column :home_page_featured_items, :teaser
  end
end
