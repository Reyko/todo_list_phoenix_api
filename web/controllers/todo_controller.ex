defmodule TodoListPhoenixApi.TodoController do
  use TodoListPhoenixApi.Web, :controller

  alias TodoListPhoenixApi.Todo

  def index(conn, _params) do
    todos = Repo.all(Todo)
    render conn, todos: todos
  end
end
