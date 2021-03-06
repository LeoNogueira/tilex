defmodule DeveloperViewsDeveloper do
  use Tilex.IntegrationCase, async: true

  alias Tilex.Integration.Pages.IndexPage

  test "via nav bar", %{session: session} do
    developer = Factory.insert!(:developer, username: "greatgrasshopper")
    sign_in(session, developer)

    session
    |> IndexPage.visit()
    |> IndexPage.ensure_page_loaded()
    |> click(Query.link("greatgrasshopper"))

    page_header = Element.text(find(session, Query.css(".page_head")))

    assert page_header =~ ~r/0 posts by greatgrasshopper/
  end
end
