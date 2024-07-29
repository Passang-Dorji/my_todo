defmodule MyTodo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      MyTodoWeb.Telemetry,
      MyTodo.Repo,
      {DNSCluster, query: Application.get_env(:my_todo, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: MyTodo.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: MyTodo.Finch},
      # Start a worker by calling: MyTodo.Worker.start_link(arg)
      # {MyTodo.Worker, arg},
      # Start to serve requests, typically the last entry
      MyTodoWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MyTodo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MyTodoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
