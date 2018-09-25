defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  alias Discuss.Forum
  alias Discuss.Forum.Topic

  def new(conn, params) do
    changeset = Forum.change_topic(%Topic{})

    render conn, "new.html", changeset: changeset
  end
end
