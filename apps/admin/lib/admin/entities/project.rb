require "types"
require "admin/entities/asset"

module Admin
  module Entities
    class Project < Dry::Struct
      attribute :id, Types::Strict::Int
      attribute :title, Types::Strict::String
      attribute :client, Types::Strict::String
      attribute :url, Types::Strict::String.optional
      attribute :intro, Types::Strict::String.optional
      attribute :summary, Types::Strict::String
      attribute :body, Types::Strict::String.optional
      attribute :slug, Types::Strict::String
      attribute :status, Types::ProjectStatus
      attribute :published_at, Types::Strict::Time.optional
      attribute :case_study, Types::Strict::Bool
      attribute :cover_image, Types::Coercible::Hash.optional
      attribute :color, Types::PostHighlightColor
      attribute :assets, Types::Coercible::Array.member(Admin::Entities::Asset).optional

      def published?
        status == "published"
      end

      def case_study?
        case_study == true
      end
    end
  end
end
