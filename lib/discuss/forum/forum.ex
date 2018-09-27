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

  def change_topic(%Topic{} = topic) do
    Topic.changeset(topic, %{})
  end

  def all_topics do
    Repo.all(Topic)
  end

  def get_topic(id) do
    case Repo.get(Topic, id) do
      nil -> {:error, "Could not find topic"}
      topic -> {:ok, topic}
    end
  end

  def update_topic(%Topic{} = topic, attrs) do
    topic
    |> Topic.changeset(attrs)
    |> Repo.update
  end
end
