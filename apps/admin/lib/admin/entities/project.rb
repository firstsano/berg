require "types"

module Admin
  module Entities
    class Project < Dry::Types::Value
      attribute :id, Types::Strict::Int
      attribute :title, Types::Strict::String
      attribute :client, Types::Strict::String
      attribute :url, Types::Strict::String
      attribute :intro, Types::Strict::String
      attribute :body, Types::String
      attribute :tags, Types::Strict::String
      attribute :slug, Types::Strict::String
      attribute :status, Types::ProjectStatus
      attribute :published_at, Types::Time
      attribute :case_study, Types::Bool

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
