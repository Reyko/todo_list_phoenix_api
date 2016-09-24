defmodule TodoListPhoenixApi.TodoView do
  use TodoListPhoenixApi.Web, :view

  def render("index.json", %{todos: todos}) do
    todos
  end

  def render("create.json", %{todo: todo}) do
    todo
  end

  def render("error.json", %{changeset: changeset}) do
    errors = Enum.map(changeset.errors, fn {attr, error} ->
      %{"#{attr}": format_error(error)}
    end) 
    %{errors: errors}
  end 
  
  defp format_error({message, values}) do 
    Enum.reduce values, message, fn {k, v}, acc -> 
      String.replace(acc, "%{#{k}}", to_string(v)) 
    end 
  end 
end
