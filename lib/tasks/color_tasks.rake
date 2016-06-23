namespace :color_tasks do
  task :environment do
    require_relative "../../component/boot"
  end

  desc "Apply colors to existing projects"
  task :colorize_projects => :environment do
    projects = Admin::Container["admin.persistence.repositories.projects"]

    projects.all.each do |project|
      color = Types::PostHighlightColor.values.sample
      projects.update(project[:id], color: color)
    end
  end
end
