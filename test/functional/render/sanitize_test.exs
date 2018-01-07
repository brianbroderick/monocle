defmodule SanitizeTest do
  use ExUnit.Case

  # TODO: Figure out a test case where sanitize makes a difference
  test "sanitize option is legal" do
    Monocle.as_html!("Sanitized", %Monocle.Options{sanitize: true})
  end

end
