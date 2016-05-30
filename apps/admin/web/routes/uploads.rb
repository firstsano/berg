class Admin::Application < Dry::Web::Application
  route "uploads" do |r|
    r.authorize do
      r.on "presign" do
        r.post do
          r.resolve "admin.uploads.operations.presign" do |presign|
            presign.()
          end
        end
      end
    end
  end
end
