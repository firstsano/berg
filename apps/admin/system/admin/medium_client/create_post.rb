require "medium"

module Admin
  module MediumClient
    class CreatePost
      include Admin::Import[
        "medium_client"
      ]

      def call(post_attrs)
        user = medium_client.users.me
        medium_client.posts.create(user, post_attrs)
      end
    end
  end
end
