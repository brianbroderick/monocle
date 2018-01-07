defmodule Functional.Parser.FootnotesTest do
  use ExUnit.Case

  alias Monocle.Block
  alias Monocle.Options


  describe "Defined" do
    @vanilla """
    foo[^1]

    [^1]: bar baz
    """
    test "Vanilla Footnote" do
      assert parse(@vanilla) == {[%Block.Para{attrs: nil, lnb: 1, lines: ["foo[^1]"]},
        %Block.FnList{attrs: ".footnotes", lnb: 3,
         blocks: [%Block.FnDef{attrs: nil, lnb: 3,
           blocks: [%Block.Para{attrs: nil, lnb: 3, lines: ["bar baz"]}],
           id: "1", number: 1}]}], []}
    end

    @li_fn """
    2. foo[^1]

    [^1]: bar baz
    """
    test "List Item Footnote" do
      assert parse(@li_fn) == {[
        %Monocle.Block.List{
          lnb: 1,
          attrs: nil,
          blocks: [%Monocle.Block.ListItem{attrs: nil, lnb: 1,
            blocks: [%Monocle.Block.Para{attrs: nil, lnb: 1, lines: ["foo[^1]"]}],
            bullet: "2.",
            spaced: false,
            type: :ol}],
        start: ~s{ start="2"},
        type: :ol},
      %Monocle.Block.FnList{attrs: ".footnotes", blocks: [%Monocle.Block.FnDef{attrs: nil, lnb: 3, blocks: [%Monocle.Block.Para{attrs: nil, lnb: 3, lines: ["bar baz"]}], id: "1", number: 1}], lnb: 3}], []}
    end

  end

  describe "Undefined" do
    @shorter_vanilla """
    foo[^1]

    [^1]: bar
    """
    test "Shorter Vanilla is not a Footnote" do
      assert parse(@shorter_vanilla) ==
      {[%Monocle.Block.Para{attrs: nil, lnb: 1, lines: ["foo[^1]"]},
        %Monocle.Block.IdDef{attrs: nil, lnb: 3, id: "^1", title: "", url: "bar"}], [{:error, 1, "footnote 1 undefined, reference to it ignored"}]}

    end

    @undefined_fn """
    foo[^1]

    [^2]: bar baz
    """
    test "Footnote" do
      assert parse(@undefined_fn) == {[%Monocle.Block.Para{attrs: nil, lines: ["foo[^1]"], lnb: 1}], [{:error, 1, "footnote 1 undefined, reference to it ignored"}]}

    end
  end

  defp parse(str) do
    {blocks, context} = Monocle.parse(str, %Options{footnotes: true})
    {blocks, context.options.messages}
  end
end
