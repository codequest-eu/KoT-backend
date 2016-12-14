defmodule Kot.Fetchers do
  alias Kot.Repo
  alias Kot.PlayerGameSession

  # fetch PlayerGameSession based on pair_code and preload associations
  def fetch_pgs(pair_code, preload_array) do
    PlayerGameSession
    |> Repo.get_by(pair_code: pair_code)
    |> Repo.preload(preload_array)
  end
end
