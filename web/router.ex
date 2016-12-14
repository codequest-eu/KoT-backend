defmodule Kot.Router do
  use Kot.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Kot do
    pipe_through :api

    # resources "/game_sessions", GameSessionController, only: [:create]
    put "/game_sessions/:pair_code/pair", GameSessionController, :pair
    put "/game_sessions/:pair_code/start", GameSessionController, :start
  end
end
