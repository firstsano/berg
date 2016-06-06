require "admin/import"
require "berg/validation/form"

module Admin
  module ExternalPosts
    module Validation
      Form = Berg::Validation.Form do
        configure do
          config.messages = :i18n
        end

        required(:title).filled(:str?)
        required(:website_url).maybe(:str?)
        required(:image_url).maybe(:str?)
        required(:status).filled(included_in?: Types::PostStatus.values)
        required(:published_at).maybe(:time?)
        required(:image_upload).maybe(:hash?).schema do
          optional(:original_url).maybe(:str?)
          optional(:file_name).maybe(:str?)
          optional(:path).maybe(:str?)
          optional(:uid).maybe(:str?)
          optional(:geometry).maybe(:str?)
          optional(:type).maybe(:str?)
          optional(:uploadURL).maybe(:str?)
        end

        rule(published_at: [:status, :published_at]) do |status, published_at|
          status.eql?("published").then(published_at.filled?)
        end
      end
    end
  end
end
