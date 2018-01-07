defmodule Monocle.Mixfile do
  use Mix.Project

  @version   "1.2.5"

  @deps  [
    { :credo,    "~> 0.8", only: [ :dev, :test ] },
    { :dialyxir, "~> 0.5", only: [ :dev, :test ] },
  ]

  @description """
    Monocle is a pure-Elixir Markdown converter.

    HTML elements are whitelisted and things like HTML classes can be customized to match a
    website's CSS needs.

    Output generation is pluggable.
    """

  ############################################################

  def project do
    [
      app:           :monocle,
      version:       @version,
      elixir:        "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env),
      escript:       escript_config(),
      deps:          @deps,
      description:   @description,
      package:       package(),
      aliases:       [docs: &docs/1, readme: &readme/1]
    ]
  end

  def application do
    [
      applications: []
    ]
  end

  defp package do
    [
      files: [
        "lib", "src", "tasks", "mix.exs", "README.md"
      ],
      maintainers: [
        "Brian Broderick <brianbroderick19@gmail.com>"
      ],
      licenses: [
        "Apache 2 (see the file LICENSE for details)"
      ],
      links: %{
        "GitHub" => "https://github.com/brianbroderick/monocle",
      }
    ]
  end

  defp escript_config do
    [ main_module: Monocle.CLI ]
  end

  defp elixirc_paths(:test), do: [ "lib", "test/support" ]
  defp elixirc_paths(_),     do: [ "lib" ]

  defp docs(args) do
    Code.load_file "tasks/docs.exs"
    Mix.Tasks.Docs.run(args)
  end

  defp readme(args) do
    Code.load_file "tasks/readme.exs"
    Mix.Tasks.Readme.run(args)
  end
end
