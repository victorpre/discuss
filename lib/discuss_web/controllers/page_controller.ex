defmodule DiscussWeb.PageController do
  use DiscussWeb, :controller

  def index(conn, _params) do
    redirect(conn, to: topic_path(conn, :index))
  end
end
