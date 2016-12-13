defmodule Kot.Router do
  use Kot.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Kot do
    pipe_through :api

    scope "/v1", V1, as: :v1 do
      resources "/game_sessions", GameSessionsController, only: [:create] do

      end
    end
  end
end
