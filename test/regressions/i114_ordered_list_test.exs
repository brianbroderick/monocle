defmodule Regressions.I114OrderedListTest do
  use ExUnit.Case
  
  @default_start """
    1. hello
    
    1. world
  """
  test "default" do
    assert Monocle.as_html!(@default_start) == "<ol>\n<li><p>hello</p>\n</li>\n<li><p>world</p>\n</li>\n</ol>\n" 
  end

  @explicit_start """
    2. hello

    1. world
  """
  test "explicit" do
    assert Monocle.as_html!(@explicit_start) == ~s{<ol start="2">\n<li><p>hello</p>\n</li>\n<li><p>world</p>\n</li>\n</ol>\n}
  end

  @scoped """
  2. hello
    4. world
        42. again
  """
  test "scoped" do
    assert Monocle.as_html!(@scoped) == ~s{<ol start="2">\n<li><p>hello</p>\n<ol start="4">\n<li><p>world</p>\n<ol start="42">\n<li>again\n</li>\n</ol>\n</li>\n</ol>\n</li>\n</ol>\n}
  end
end
