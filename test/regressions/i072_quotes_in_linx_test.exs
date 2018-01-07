defmodule Regressions.I072QuotesInLinx do
  use ExUnit.Case

  test "Issue https://github.com/pragdave/earmark/issues/72" do
    # assert Monocle.as_html!(~s{"Monocle"}) ==
    # ~s{<p>“Monocle”</p>\n}
    assert Monocle.as_html!(~s{["Monocle"](https://github.com/pragdave/earmark/)}) ==
    ~s{<p><a href="https://github.com/pragdave/earmark/">“Monocle”</a></p>\n}
  end

end
