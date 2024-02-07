defmodule StreamsPlaceholderBugWeb.PageControllerTest do
  use StreamsPlaceholderBugWeb.ConnCase

  import Phoenix.LiveViewTest

  test "songs", %{conn: conn} do
    {:ok, view, html} = live(conn, ~p"/")

    assert html =~ "SONGS PLACEHOLDER"

    assert view |> element("#songs") |> render() =~ "SONGS PLACEHOLDER"
  end

  test "albums", %{conn: conn} do
    {:ok, view, html} = live(conn, ~p"/")

    assert html =~ "ALBUMS PLACEHOLDER"

    assert view |> element("#albums") |> render() =~ "ALBUMS PLACEHOLDER"
    assert view |> element("#albums") |> render_async() =~ "ALBUMS PLACEHOLDER"
  end
end
