defmodule MonocleHelpersTests.LexerTest do
  use ExUnit.Case

  import Monocle.Helpers.LeexHelpers

  test "correct dispatch to leex lexer" do
    assert [{:verbatim, 1, 'hello '}, {:verbatim, 1, '\\'}] == lex( "hello \\", with: :string_lexer)
  end
  test "catching errors" do

  end
end
