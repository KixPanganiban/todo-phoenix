use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :todo_phoenix, TodoPhoenix.Endpoint,
  secret_key_base: "YRCLe06U3Cu3kk2CWLhLrkU9hqfHTnGLj3f3xcQbrqZYJI8kn9IPS1yBjwz5lSac"

# Configure your database
config :todo_phoenix, TodoPhoenix.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: {:system, "DATABASE_URL"},
  pool_size: 20
