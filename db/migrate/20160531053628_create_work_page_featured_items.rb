ROM::SQL.migration do
  up do
    create_table :work_page_featured_items do
      primary_key :id
      Integer :position, null: false
      String  :title, null: false
      String  :description, null: false
      String  :url, null: false
      column :cover_image, :json, null: false, default: "{}"
    end
  end

  down do
    drop_table :work_page_featured_items
  end
end
