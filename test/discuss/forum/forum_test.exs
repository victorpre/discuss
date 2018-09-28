defmodule Discuss.ForumTest do
  use Discuss.DataCase

  alias Discuss.Forum

  describe "topics" do
    alias Discuss.Forum.Topic

    @valid_attrs %{title: "some title"}
    @update_attrs %{title: "some other title"}
    @invalid_attrs %{title: nil}

    def topic_fixture(attrs \\ %{}) do
      {:ok, topic} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Forum.create_topic()

      topic
    end

    test "create_topic/1 with valid data creates a item" do
      assert {:ok, %Topic{} = topic} = Forum.create_topic(@valid_attrs)
      assert topic.title == "some title"
    end

    test "create_topic/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Forum.create_topic(@invalid_attrs)
    end
  end
end
