require "admin/import"
require "berg/validation/form"

module Admin
  module CuratedPosts
    module Validation
      Form = Berg::Validation.Form do
        configure do
          config.messages = :i18n
        end

        required(:title).maybe(:str?)
        required(:body).maybe(:str?)
        required(:link_url).filled
        required(:link_title).filled
        required(:image_url).maybe(:str?)
        required(:image_upload).maybe(:hash?)
        required(:status).filled(included_in?: Types::PostStatus.values)
        required(:published_at).maybe(:time?)

        rule(published_at: [:status, :published_at]) do |status, published_at|
          status.eql?("published").then(published_at.filled?)
        end

        rule(image_url: [:image_url, :image_upload]) do |image_url, image_upload|
          image_url.filled? ^ image_upload.filled?
        end
      end
    end
  end
end
