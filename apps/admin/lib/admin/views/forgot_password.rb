require "admin/view"

module Admin
  module Views
    class ForgotPassword < Admin::View
      configure do |config|
        config.name = "admin_minimal"
        config.template = "forgot_password"
      end
    end
  end
end
