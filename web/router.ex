defmodule Kot.Router do
  use Kot.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Kot do
    pipe_through :api

    resources "/game_sessions", GameSessionController, only: [:create, :index] do
      # put "/:pair_code/start", GameSessionController
    end
  end
end
