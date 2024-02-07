defmodule StreamsPlaceholderBugWeb.HomeLive do
  use StreamsPlaceholderBugWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign_async(:artist, fn -> {:ok, %{artist: %{name: "Foo Bar"}}} end)
     |> stream(:songs, [])
     |> stream(:albums, [])}
  end

  def render(assigns) do
    ~H"""
    <div>
      <.async_result :let={artist} assign={@artist}>
        <h3>Artist: <%= artist.name %></h3>

        <div id="albums" phx-update="stream">
          <div :for={{dom_id, album} <- @streams.albums} id={dom_id}><%= album.title %></div>
          <div id="albums-placeholder" class="hidden only:block">
            ALBUMS PLACEHOLDER
          </div>
        </div>
      </.async_result>
      <div id="songs" phx-update="stream">
        <div :for={{dom_id, song} <- @streams.songs} id={dom_id}>
          <%= song.title %>
        </div>
        <div id="songs-placeholder" class="hidden only:block">
          SONGS PLACEHOLDER
        </div>
      </div>
    </div>
    """
  end
end
