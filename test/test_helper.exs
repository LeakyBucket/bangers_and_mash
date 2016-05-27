ExUnit.start

Mix.Task.run "ecto.create", ~w(-r BangersAndMash.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r BangersAndMash.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(BangersAndMash.Repo)

