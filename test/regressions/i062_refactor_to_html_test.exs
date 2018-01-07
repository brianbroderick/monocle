defmodule Regressions.I062RefactorToHtmlTest do
  use ExUnit.Case

  test "deprecation warning for to_html" do 
    assert_raise(UndefinedFunctionError, ~r{function Monocle\.to_html/1 is undefined or private.*}, fn ->
      Monocle.to_html("* hello")
    end)
  end

  test "as_html! takes place" do 
    assert Monocle.as_html!("* hello") == "<ul>\n<li>hello\n</li>\n</ul>\n"
  end
  
end
