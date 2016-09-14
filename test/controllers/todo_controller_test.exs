defmodule TodoListPhoenixApi.TodoControllerTest do
  use TodoListPhoenixApi.ConnCase, async: true

  import TodoListPhoenixApi.Factory

  test "GET /" do
    todos = insert_list(3, :todo)
    conn = get conn(), "/api/todos" 
    assert conn.status == 200 
    assert conn.resp_body == Poison.encode!(todos)
  end
end
