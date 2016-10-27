defmodule TodoPhoenix.TodoController do
  use TodoPhoenix.Web, :controller

  alias TodoPhoenix.Todo

  def index(conn, _params) do
    todo = Repo.all(Todo)
    render(conn, "index.json", todo: todo)
  end

  def create(conn, todo_params) do
    changeset = Todo.changeset(%Todo{}, todo_params)

    case Repo.insert(changeset) do
      {:ok, todo} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", todo_path(conn, :show, todo))
        |> render("show.json", todo: todo)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(TodoPhoenix.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    todo = Repo.get!(Todo, id)
    render(conn, "show.json", todo: todo)
  end

  def update(conn, %{"id" => id} = todo_params) do
    todo = Repo.get!(Todo, id)
    changeset = Todo.changeset(todo, todo_params)

    case Repo.update(changeset) do
      {:ok, todo} ->
        render(conn, "show.json", todo: todo)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(TodoPhoenix.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    todo = Repo.get!(Todo, id)
    Repo.delete!(todo)
    send_resp(conn, :ok, "{}")
  end

  def delete(conn, _params) do
    Repo.delete_all(Todo)
    send_resp(conn, :ok, "[]")
  end

  def options(conn, %{"id" => _id}) do
    send_resp(conn, :ok, "GET,PATCH,DELETE")
  end

  def options(conn, _params) do
    send_resp(conn, :ok, "GET,POST,DELETE")
  end
end
