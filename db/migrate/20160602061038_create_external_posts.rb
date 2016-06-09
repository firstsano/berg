ROM::SQL.migration do
  up do
    create_table :curated_posts do
      primary_key :id
      String  :title, null: true
      String  :website_url, null: true
      String  :image_url, null: true
      column :image_upload, :json, null: true, default: "{}"
      String :status, default: "draft"
      DateTime :published_at
      DateTime :created_at, null: false, default: Sequel::CURRENT_TIMESTAMP
      DateTime :updated_at, null: false, default: Sequel::CURRENT_TIMESTAMP
    end

    run <<-SQL
      CREATE TRIGGER set_updated_at_on_curated_posts
        BEFORE UPDATE ON curated_posts FOR EACH ROW
        EXECUTE PROCEDURE set_updated_at_column();
    SQL
  end

  down do
    run <<-SQL
      DROP TRIGGER IF EXISTS set_updated_at_on_curated_posts ON curated_posts;
    SQL

    drop_table :curated_posts
  end
end
