require "berg/entity"

module Admin
  module Entities
    class User < Berg::Entity
      def active?
        active.equal?(true)
      end
    end
  end
end
