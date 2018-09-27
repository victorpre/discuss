defmodule DiscussWeb.FallbackController do
  use DiscussWeb, :controller

  def call(conn, {:error, msg}) when is_binary(msg) do
    conn
    |> put_flash(:error, msg)
    |> redirect(to: topic_path(conn, :index))
  end
end
