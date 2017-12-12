defmodule MonocleTest do
  use ExUnit.Case
  doctest Monocle

  test "greets the world" do
    assert Monocle.hello() == :world
  end
end
