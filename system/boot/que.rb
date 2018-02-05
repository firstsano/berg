Berg::Container.boot(:que) do |berg|
  start do
    require "que"

    Que.logger = berg[:logger]
    Que.mode = :sync if berg.env == :test
    Que.connection = berg["persistence.db"]
  end
end
