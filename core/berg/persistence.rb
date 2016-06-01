Berg::Container.namespace "persistence" do |container|
  container.register "commands.create_post" do
    container["persistence.rom"].command(:posts)[:create]
  end

  container.register "commands.create_user" do
    container["persistence.rom"].command(:users)[:create]
  end

  container.register "commands.create_person" do
    container["persistence.rom"].command(:people)[:create]
  end

  container.register "commands.update_post" do
    container["persistence.rom"].command(:posts)[:update]
  end

  container.register "commands.update_home_page_featured_items" do
    container["persistence.rom"].command(:home_page_featured_items)[:update]
  end

  container.register "commands.create_category" do
    container["persistence.rom"].command(:categories)[:create]
  end

  container.register "commands.create_categorisations" do
    container["persistence.rom"].command(:categorisations)[:create]
  end

  container.register "commands.update_about_page_people" do
    container["persistence.rom"].command(:about_page_people)[:update]
  end

  container.register "commands.update_work_page_featured_items" do
    container["persistence.rom"].command(:work_page_featured_items)[:update]
  end

  container.register "commands.update_office_contact_details" do
    container["persistence.rom"].command(:office_contact_details)[:update]
  end
end
