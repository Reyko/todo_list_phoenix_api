defmodule TodoListPhoenixApi.TodoView do
  use TodoListPhoenixApi.Web, :view

  def render("index.json", %{todos: todos}) do
    todos
  end
end
