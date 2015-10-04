defmodule Tmate.Router do
  use Tmate.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Tmate do
    pipe_through :browser # Use the default browser stack

    get "/*path", PageController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", Tmate do
  #   pipe_through :api
  # end
end