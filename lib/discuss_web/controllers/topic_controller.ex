defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  alias Discuss.Forum
  alias Discuss.Forum.Topic

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
end
