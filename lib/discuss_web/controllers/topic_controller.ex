defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  def new(conn, params) do
    IO.puts "+++++"
    IO.inspect conn
    IO.puts "+++++"
    IO.inspect params
    # render conn, "index.html"
  end
end
