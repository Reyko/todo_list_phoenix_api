defmodule TodoListPhoenixApi.Factory do
  use ExMachina.Ecto, repo: TodoListPhoenixApi.Repo

  def todo_factory do
    %TodoListPhoenixApi.Todo{
      title: "I have something to do" 
    }
  end
end
