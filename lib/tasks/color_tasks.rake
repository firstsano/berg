namespace :color_tasks do
  task :environment do
    require_relative "../../component/boot"
  end

  desc "Apply colors to existing projects"
  task :colorize_projects => :environment do
    projects = Admin::Container["admin.persistence.repositories.projects"]

    projects.listing.each do |project|
      projects.update(project[:id], color: Types::PostHighlightColor.values.sample)
    end
  end
end
