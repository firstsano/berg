require "main/transactions"

Main::Transactions.define do |t|
  # Define your dry-transaction objects here:
  #
  # t.define "transactions.users.sign_up" do
  #   step :persist, with: "users.operations.sign_up"
  # end
end
