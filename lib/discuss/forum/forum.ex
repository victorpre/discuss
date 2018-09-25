defmodule Discuss.Forum do
  @moduledoc """
  The Forum context.
  """

  import Ecto.Query, warn: false
  alias Discuss.Repo
  alias Discuss.Forum.Topic

  def create_topic(attrs \\ %{}) do
    %Topic{}
    |> Topic.changeset(attrs)
    |> Repo.insert()
  end
end
