defmodule Kot.Router do
  use Kot.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Kot do
    pipe_through :api

    #DESKTOP
    put "/game_sessions/:pair_code/pair", GameSessionController, :pair
    put "/game_sessions/:pair_code/start", GameSessionController, :start
    resources "/combat_logs", CombatLogController, only: [:create]
    #DESKTOP END

    #FRONTEND
    resources "/game_sessions/", GameSessionController, only: [:create]
    resources "/game_tables/", GameTableController, only: [:index]
    get "/player_game_sessions/:id/status", PlayerGameSessionController, :status
    #FRONTEND END
  end
end
