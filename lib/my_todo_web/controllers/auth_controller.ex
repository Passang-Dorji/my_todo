defmodule MyTodoWeb.AuthController do
  use MyTodoWeb, :controller
  alias MyTodo.Accounts
  def signup(conn, %{"name" => name, "email"=> email}) do
    case Accounts.create_user(%{name: name, email: email}) do
      {:ok, user} ->
        conn
        |>put_status(:created)
        |>json(%{id: user.id, name: user.name, email: user.email})
        {:error, changeset} ->
        conn
        |>put_status(:unrocessable_entity)
        |>json(%{errors: changeset})
    end
  end
  def login(conn, %{"name" => name, "email"=> email}) do
    case Accounts.get_user_by_credential(name, email) do
      {:ok, user} ->
        conn
        |>json(%{id: user.id, name: user.name, email: user.email})
       _ ->
          conn
          |>put_status(:unauthorized)
          |>json(%{error: "invalid credential"})
    end
  end
end
