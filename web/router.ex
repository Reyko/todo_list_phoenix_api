defmodule TodoListPhoenixApi.Router do
  use TodoListPhoenixApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TodoListPhoenixApi do
    pipe_through :api
    get "/todos", TodoController, :index
  end
end
