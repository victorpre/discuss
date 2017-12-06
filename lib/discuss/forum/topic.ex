defmodule Discuss.Forum.Topic do
  @moduledoc """
  The Topic Model
  """

  use Ecto.Schema
  import Ecto.Changeset

  alias Discuss.Forum.Topic
  # So %Topic can be called without the modules prepended

  schema "topics" do
    field :title, :string
  end

  def changeset(%Topic{} = topic, attrs) do
    topic
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
