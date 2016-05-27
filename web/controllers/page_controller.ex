defmodule BangersAndMash.PageController do
  use BangersAndMash.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
