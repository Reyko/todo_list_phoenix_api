# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :todo_list_phoenix_api,
  ecto_repos: [TodoListPhoenixApi.Repo]

# Configures the endpoint
config :todo_list_phoenix_api, TodoListPhoenixApi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "c0YBWKkaQQx88UJ/cCpl1F4c9ekMFaex6J7coZZexEC6fhpBrn37x85daPUX4CMb",
  render_errors: [view: TodoListPhoenixApi.ErrorView, accepts: ~w(json)],
  pubsub: [name: TodoListPhoenixApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"