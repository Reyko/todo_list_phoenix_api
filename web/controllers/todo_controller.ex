defmodule TodoListPhoenixApi.TodoController do
  use TodoListPhoenixApi.Web, :controller

  alias TodoListPhoenixApi.Todo

  def index(conn, _params) do
    todos = Repo.all(Todo)
    render conn, todos: todos
  end

  def create(conn, %{"todo" => todo_params}) do
    todo = Todo.changeset(%Todo{}, todo_params)
    case Repo.insert(todo) do
      {:ok, todo} -> render conn |> put_status(201), todo: todo
      {:error, changeset} -> render(conn |> put_status(422), "error.json", changeset: changeset) 
    end
  end
end
