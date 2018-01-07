defmodule Regressions.I127NestedListsClosedTooEarlyTest do
  use ExUnit.Case

  @markdown """
  - Level 1
    - level 2 - 1
      - level 3 - 1
      - level 3 - 2
      - level 3 - 3
    - level 2 - 2
  """

  @html """
  <ul>
  <li><p>Level 1</p>
  <ul>
  <li><p>level 2 - 1</p>
  <ul>
  <li>level 3 - 1
  </li>
  <li>level 3 - 2
  </li>
  <li>level 3 - 3
  </li>
  </ul>
  </li>
  <li>level 2 - 2
  </li>
  </ul>
  </li>
  </ul>
  """

  test "correct levels are used for each item" do
    assert Monocle.as_html!(@markdown) == @html
  end

end
