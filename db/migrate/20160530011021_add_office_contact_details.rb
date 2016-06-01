ROM::SQL.migration do
  up do
    create_table :office_contact_details do
      primary_key :id
      Integer :position, null: false
      String :name, null: false
      String :address, null: false
      String :phone_number, null: false
    end
  end

  down do
    drop_table :office_contact_details
  end
end
