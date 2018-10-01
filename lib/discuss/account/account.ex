defmodule Discuss.Account do
  @moduledoc """
  The Account context.
  """

  import Ecto.Query, warn: false
  alias Discuss.Repo
  alias Discuss.Account.User

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert
  end

end
