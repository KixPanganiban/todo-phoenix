defmodule TodoPhoenix.PageController do
  use TodoPhoenix.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
