defmodule Regressions.I1102spacedListsTest do
  use ExUnit.Case
  
  @quadruple_spaced """
  * alpha
       * beta
           * gamma
  """
  test "four still create a new list" do 
    assert Monocle.as_html!(@quadruple_spaced) == "<ul>\n<li><p>alpha</p>\n<ul>\n<li><p>beta</p>\n<ul>\n<li>gamma\n</li>\n</ul>\n</li>\n</ul>\n</li>\n</ul>\n"
  end

  @double_spaced """
  * alpha
    * beta
      * gamma
  """
  test "two create a new list too" do 
    assert Monocle.as_html!(@double_spaced) == "<ul>\n<li><p>alpha</p>\n<ul>\n<li><p>beta</p>\n<ul>\n<li>gamma\n</li>\n</ul>\n</li>\n</ul>\n</li>\n</ul>\n"
  end

  @double_spaced2 """
    * alpha
      * beta
        * gamma
  """
  test "two create a new list too, indented by 2" do 
    assert Monocle.as_html!(@double_spaced2) == "<ul>\n<li><p>alpha</p>\n<ul>\n<li><p>beta</p>\n<ul>\n<li>gamma\n</li>\n</ul>\n</li>\n</ul>\n</li>\n</ul>\n"
  end

  @double_spaced1 """
   * alpha
     * beta
       * gamma
  """
  test "two create a new list too, indented by 1" do 
    assert Monocle.as_html!(@double_spaced1) == "<ul>\n<li><p>alpha</p>\n<ul>\n<li><p>beta</p>\n<ul>\n<li>gamma\n</li>\n</ul>\n</li>\n</ul>\n</li>\n</ul>\n"
  end
  @single_spaced """
  * alpha
   * beta
    * gamma
  """
  test "single does not create a new list" do 
    assert Monocle.as_html!(@single_spaced) == "<ul>\n<li>alpha\n</li>\n<li>beta\n</li>\n<li>gamma\n</li>\n</ul>\n"
  end

  @no_sublist """
  * alpha
  * omega
  """
  test "no sublists" do 
    assert Monocle.as_html!(@no_sublist) == "<ul>\n<li>alpha\n</li>\n<li>omega\n</li>\n</ul>\n"
  end

end
