defmodule DiscussWeb.FallbackController do
  use DiscussWeb, :controller

  def call(conn, {:error, msg}) when is_binary(msg) do
    conn
    |> put_flash(:error, msg)
    |> redirect(to: topic_path(conn, :index))
  end

  def call(conn, {:error, %Ecto.Changeset{}}) do
    action_name = action_name(conn)
    conn
    |> put_flash(:error, get_msg(action_name))
    |> redirect(to: topic_path(conn, :index))
  end

  defp get_msg(action_name) do
    Map.get(error_msgs(), action_name, "There was an error")
  end

  defp error_msgs do
    %{create: "There was an error creating your topic.",
      update: "There was an error updating your topic",
      delete: "There was an error deleting your topic"}
  end

  defp error_routes do
    %{create: :new,
      update: :edit,
      delete: :index}
  end
end
