defmodule Regressions.I168UnderlineH2AfterListTest do
  use ExUnit.Case

  @h2_underline_vanilla """
  para

  hl2
  ---
  """

  test "underline vanilla underline h2" do
    {:ok, result, []} = Monocle.as_html(@h2_underline_vanilla)
    assert result == "<p>para</p>\n<h2>hl2</h2>\n"
  end

  @h2_underline_after_ul """
  * para

  hl2
  ---
  """
  test "underline after ul" do
    {:ok, result, []} = Monocle.as_html(@h2_underline_after_ul)
    assert result == "<ul>\n<li>para\n</li>\n</ul>\n<h2>hl2</h2>\n"
  end
end
