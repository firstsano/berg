require "admin/transactions"

Admin::Transactions.define do |t|
  t.define "transactions.create_user" do
    step :create, with: "users.operations.create"
    enqueue :send_activation_email, with: "users.operations.send_activation_email"
  end

  t.define "transactions.request_password_reset" do
    step :update_access_token, with: "users.operations.update_access_token"
    enqueue :send_reset_password_email, with: "users.operations.send_reset_password_email"
  end
end
