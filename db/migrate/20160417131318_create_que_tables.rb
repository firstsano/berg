ROM::SQL.migration do
  change do
    Berg::Container.start :que
    Que.migrate!
  end
end
