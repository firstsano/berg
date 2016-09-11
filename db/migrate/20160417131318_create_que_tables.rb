ROM::SQL.migration do
  change do
    Umbrella::Container.boot! :que
    Que.migrate!
  end
end
