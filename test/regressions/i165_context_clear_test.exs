defmodule Regressions.I165ContextClearTest do
  use ExUnit.Case
  
  alias Monocle.Context
  alias Monocle.Options

  test "clearing, clears value and messages" do 
    context = %Context{options: %Options{messages: [{:error, 'not so good', 42}]}, value: 43}
    cleared_context = Context.clear( context )

    assert cleared_context.value == []
    assert cleared_context.options.messages == []
  end
end
