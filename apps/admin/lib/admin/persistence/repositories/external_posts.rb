require "berg/repository"
require "admin/entities/external_post"

module Admin
  module Persistence
    module Repositories
      class ExternalPosts < Berg::Repository[:external_posts]
        commands :create, update: [:by_id]

        def [](id)
          external_posts.by_id(id).as(Entities::ExternalPost).one
        end

        def listing(per_page: 20, page: 1)
          external_posts
            .per_page(per_page)
            .page(page)
            .order(Sequel.desc(:created_at))
            .as(Entities::ExternalPost)
        end
      end
    end
  end
end
