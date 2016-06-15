ROM::SQL.migration do
  up do
    add_column :home_page_featured_items, :teaser, String
  end

  down do
    drop_column :home_page_featured_items, :teaser
  end
end
