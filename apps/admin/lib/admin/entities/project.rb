require "types"
require "admin/entities/asset"

module Admin
  module Entities
    class Project < Dry::Types::Struct
      attribute :id, Types::Strict::Int
      attribute :title, Types::Strict::String
      attribute :client, Types::Strict::String
      attribute :url, Types::Strict::String
      attribute :intro, Types::Strict::String
      attribute :body, Types::Strict::String.optional
      attribute :slug, Types::Strict::String
      attribute :status, Types::ProjectStatus
      attribute :published_at, Types::Strict::Time.optional
      attribute :case_study, Types::Strict::Bool
      attribute :cover_image, Types::Coercible::Hash.optional
      attribute :assets, Types::Coercible::Array.member(Admin::Entities::Asset).optional

      def deleted?
        status == "deleted"
      end

      def published?
        status == "published"
      end

      def case_study?
        case_study == true
      end
    end
  end
end
