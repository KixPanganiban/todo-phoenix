defmodule TodoPhoenix.TodoView do
  use TodoPhoenix.Web, :view

  def render("index.json", %{todo: todo}) do
    render_many(todo, TodoPhoenix.TodoView, "todo.json")
  end

  def render("show.json", %{todo: todo}) do
    render_one(todo, TodoPhoenix.TodoView, "todo.json")
  end

  def render("todo.json", %{todo: todo}) do
    %{id: todo.id,
      title: todo.title,
      order: todo.order,
      completed: todo.completed,
      url: abs_todo_path(todo)
    }
  end

  defp abs_todo_path(todo) do
    TodoPhoenix.Endpoint.url() <> todo_path(TodoPhoenix.Endpoint, :show, todo)
  end
end
