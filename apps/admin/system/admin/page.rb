require "berg/page"
require "admin/import"

module Admin
  class Page < Berg::Page
    include Admin::Import.hash[assets: "core.assets"]

    def authorized(current_user)
      Authorized.new(options.merge(current_user: current_user))
    end

    def authorized?
      false
    end

    class Authorized < Page
      attr_reader :current_user

      def current_user
        self[:current_user]
      end

      def authorized?
        true
      end
    end
  end
end
