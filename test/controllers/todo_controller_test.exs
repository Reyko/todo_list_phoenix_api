defmodule TodoListPhoenixApi.TodoControllerTest do
  use TodoListPhoenixApi.ConnCase, async: true

  import TodoListPhoenixApi.Factory

  test "GET /" do
    todos = insert_list(3, :todo)
    conn = get conn(), "/api/todos" 
    assert conn.status == 200 
    assert conn.resp_body == Poison.encode!(todos)
  end

  describe "POST /todos" do
    test "with valid params" do
      params = %{title: "a new todo"}
      conn = post conn(), "/api/todos", %{todo: params}
      response = Poison.Parser.parse!(conn.resp_body)
      assert conn.status == 201
      assert response["title"] == params.title
    end

    test "with invalid params" do
      params = %{title: ""}
      conn = post conn(), "/api/todos", %{todo: params}
      response = Poison.Parser.parse!(conn.resp_body)
      errors = Enum.at(response["errors"], 0)
      assert conn.status == 422
      assert errors["title"] == "can't be blank"
    end
  end

  describe "PUT /todos/:id" do
    test 'with valid params' do
      todo = insert(:todo)
      params = %{title: "my title changed"}
      conn = put conn(), "api/todos/#{todo.id}", %{todo: params}
      response = Poison.Parser.parse!(conn.resp_body)
      assert conn.status == 200
      assert response["title"] == params.title
    end

    test "with invalid params" do
      todo = insert(:todo)
      params = %{title: ""}
      conn = put conn(), "api/todos/#{todo.id}", %{todo: params}
      response = Poison.Parser.parse!(conn.resp_body)
      errors = Enum.at(response["errors"], 0)
      assert conn.status == 422
      assert errors["title"] == "can't be blank" 
    end
  end
end
