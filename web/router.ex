defmodule TodoPhoenix.Router do
  use TodoPhoenix.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :cors
  end

  scope "/", TodoPhoenix do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", TodoPhoenix do
    pipe_through :api

    resources "/todo", TodoController
    delete "/todo", TodoController, :delete
    options "/todo/:id", TodoController, :options
    options "/todo", TodoController, :options
  end

  def cors(conn, _opts) do
    conn
    |> put_resp_header("Access-Control-Allow-Origin", "*")
    |> put_resp_header("Access-Control-Allow-Methods", "GET,PATCH,POST,DELETE,OPTIONS")
    |> put_resp_header("Access-Control-Allow-Headers", "Content-Type")
  end
end
