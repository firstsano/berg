require "berg/repository"
require "admin/entities"

module Admin
  module Persistence
    module Repositories
      class Users < Berg::Repository[:users]
        struct_namespace Admin::Entities

        commands :create, update: [:by_id, :by_email]

        alias_method :update, :update_by_id

        def [](id)
          users.by_id(id).as(Entities::User).one!
        end

        def by_email!(email)
          users.by_email(email).one!
        end

        def by_email_for_authentication(email)
          users.active.by_email(email).one
        end

        def by_access_token(token)
          users.by_access_token(token).one
        end

        def listing
          users.to_a
        end
      end
    end
  end
end
