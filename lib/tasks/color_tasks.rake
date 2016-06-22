namespace :color_tasks do
  task :environment do
    require_relative "../../component/boot"
  end

  desc "Apply colors to existing projects"
  task :colorize_projects => :environment do
    project_color_picker = Admin::Container["admin.persistence.post_color_picker"]
    projects = Admin::Container["admin.persistence.repositories.projects"]

    projects.all.each do |project|
      projects.update(project[:id], color: project_color_picker.())
    end
  end
end
