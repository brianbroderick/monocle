defmodule Support.Parser do
  def parse_lines lines do
    Monocle.Parser.parse(%Monocle.Options{}, lines, false)
  end
end
