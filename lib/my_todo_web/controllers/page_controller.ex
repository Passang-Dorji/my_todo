defmodule MyTodoWeb.PageController do
  use MyTodoWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end
  def users(conn, _params) do
    users = [
      %{id: 1, name: "passang", email: "passang@gmail.com"},
      %{id: 2, name: "Dorji", email: "dorji@gmail.com"}
    ]
    # render(conn, :users, users: users,layout: false)
    json(conn, %{users: users}) # to render json data
  end
end
