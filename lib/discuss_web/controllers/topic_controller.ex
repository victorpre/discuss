defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  alias Discuss.Forum
  alias Discuss.Forum.Topic

  action_fallback DiscussWeb.FallbackController

  def new(conn, _params) do
    changeset = Forum.change_topic(%Topic{})

    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"topic" => topic_params}) do
    case Forum.create_topic(topic_params) do
      {:ok, topic} ->
        conn
        |> put_flash(:info, "Topic created")
        |> redirect(to: topic_path(conn, :index))
      {:error, changeset} -> render conn, "new.html", changeset: changeset
    end
  end

  def index(conn, _params) do
    topics = Forum.all_topics
    render conn, "index.html", topics: topics
  end

  def edit(conn, %{"id" => topic_id}) do
    with {:ok, topic} <- Forum.get_topic(topic_id) do
      changeset = Forum.change_topic(topic)
      render(conn, "edit.html", topic: topic, changeset: changeset)
    end
  end

  def update(conn, %{"id" => id, "topic" => topic_params}) do
    with {:ok, topic} <- Forum.get_topic(id),
         {:ok, topic} <- Forum.update_topic(topic, topic_params) do

      conn
      |> put_flash(:info, "Topic updated successfully")
      |> redirect(to: topic_path(conn, :index))
    end
  end
end
