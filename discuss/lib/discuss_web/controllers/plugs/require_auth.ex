defmodule DiscussWeb.Plugs.RequireAuth do
    import Plug.Conn
    import Phoenix.Controller
    
    alias DiscussWeb.Router.Helpers, as: Routes

    def init(default), do: default

    def call(conn, _params) do
        if conn.assigns[:user] do
            conn
        else
            conn
            |> put_flash(:error, "You need to be connected !")
            |> redirect(to: Routes.topic_path(conn, :index))
            |> halt()
        end
    end
end