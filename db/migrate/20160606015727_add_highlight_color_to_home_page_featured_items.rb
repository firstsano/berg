ROM::SQL.migration do
  up do
    add_column :home_page_featured_items, :highlight_color, String, null: false, default: ""
  end

  down do
    drop_column :home_page_featured_items, :highlight_color
  end
end
