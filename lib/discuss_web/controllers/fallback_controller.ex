defmodule DiscussWeb.FallbackController do
  use DiscussWeb, :controller

  def call(conn, {:error, msg}) when is_binary(msg) do
    conn
    |> put_flash(:error, msg)
    |> redirect(to: topic_path(conn, :index))
  end

  def call(conn, {:error, %Ecto.Changeset{}}) do
    conn
    |> put_flash(:error, get_msg(conn))
    |> redirect(to: topic_path(conn, :index))
  end

  defp get_msg(conn) do
    name = action_name(conn)
    Map.get(error_msgs(), name, "There was an error")
  end

  defp error_msgs do
    %{create: "There was an error creating your topic.",
      update: "There was an error updating your topic"}
  end
end
