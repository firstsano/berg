ROM::SQL.migration do
  up do
    set_column_type(:people, :avatar, 'json USING CAST(avatar AS json)')
  end

  down do
    set_column_type(:people, :avatar, 'char(255) USING CAST(avatar AS char)')
  end
end
