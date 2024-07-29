defmodule MyTodo.Repo do
  use Ecto.Repo,
    otp_app: :my_todo,
    adapter: Ecto.Adapters.Postgres
end
