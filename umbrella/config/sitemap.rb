require "sitemap_generator"
require "fog/aws"
require "mime-types"

require_relative "../system/boot"

sitemaps = Main::Container["persistence.repositories.sitemaps"]
config = Umbrella::Container["config"]

# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = config.canonical_domain

# Store the sitemap on s3
SitemapGenerator::Sitemap.sitemaps_host = "http://#{config.aws_bucket}.s3.amazonaws.com/"
SitemapGenerator::Sitemap.public_path   = "tmp/"
SitemapGenerator::Sitemap.sitemaps_path = "sitemap/"
SitemapGenerator::Sitemap.adapter       = SitemapGenerator::S3Adapter.new(aws_access_key_id: config.aws_access_key_id,
                                                                          aws_secret_access_key: config.aws_secret_access_key,
                                                                          fog_provider: :aws,
                                                                          fog_directory: config.aws_bucket,
                                                                          fog_region: config.aws_region)

SitemapGenerator::Sitemap.create do
  # Pages
  add "/about"
  add "/contact"
  add "/notes"
  add "/work"

  # Posts
  posts = sitemaps.post_slugs
  posts.each do |p| add "/notes/#{p}" end

  # Projects
  projects = sitemaps.project_slugs
  projects.each do |p| add "/work/#{p}" end
end
