defmodule TodoListPhoenixApi.Todo do
  use TodoListPhoenixApi.Web, :model
  @derive {Poison.Encoder, only: [:title, :id]}

  schema "todos" do
    field :title, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
  end
end
