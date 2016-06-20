ROM::SQL.migration do
  up do
    add_column :office_contact_details, :latitude, String, null: false, default: ""
    add_column :office_contact_details, :longitude, String, null: false, default: ""
  end

  down do
    drop_column :office_contact_details, :latitude
    drop_column :office_contact_details, :longitude
  end
end
