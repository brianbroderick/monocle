defmodule Regressions.I093LastLiNotWrappedInPTest do
  use ExUnit.Case

  @vanilla_list """
  * a

  * b
  """
  test "vanilla list" do
    assert "<ul>\n<li><p>a</p>\n</li>\n<li><p>b</p>\n</li>\n</ul>\n" == Monocle.as_html!( @vanilla_list )
  end

  test "parsing the vanilla list does not space the last item - Renderer's job for now" do
    expected =
    {[%Monocle.Block.List{attrs: nil,
       blocks: [%Monocle.Block.ListItem{lnb: 1, attrs: nil,
         blocks: [%Monocle.Block.Para{lnb: 1, attrs: nil, lines: ["a"]}],
         bullet: "*", spaced: true, type: :ul},
       %Monocle.Block.ListItem{lnb: 3, attrs: nil,
        blocks: [%Monocle.Block.Para{lnb: 3, attrs: nil, lines: ["b"]}],
        bullet: "*", spaced: true, type: :ul}], type: :ul}], %{}, %Monocle.Options{line: 3}}

     assert @vanilla_list |> String.split(~r{\n}) |>Monocle.Parser.parse() == expected
  end

  @longer """
  * a

  * b

  Meaningless Text
  """
  test "not at EOF" do
    assert "<ul>\n<li><p>a</p>\n</li>\n<li><p>b</p>\n</li>\n</ul>\n<p>Meaningless Text</p>\n" == Monocle.as_html!( @longer )
  end
end
