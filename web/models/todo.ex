defmodule TodoPhoenix.Todo do
  use TodoPhoenix.Web, :model

  schema "todo" do
    field :title, :string
    field :order, :integer, default: 1
    field :completed, :boolean, default: false

    timestamps()
  end

  @optional_fields ~w(order, completed)
  @required_fields ~w(title)

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :order, :completed])
    |> validate_required([:title, :order, :completed])
  end
end
