defmodule Clone.Mixfile do
  use Mix.Project

  def project do
    [
      app: :clone,
      version: "0.1.0",
      elixir: "~> 1.3",
      deps: deps(),
      description: description(),
      package: package(),
    ]
  end

  defp deps do
    [
      {:earmark,   ">= 0.0.0", only: :dev},
      {:ex_doc,    ">= 0.0.0", only: :dev},
    ]
  end

  defp description do
    """
    An Elixir library to clone/rewrite module functions
    """
  end

  defp package do
    [maintainers: ["Bartosz Kalinowski"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/kelostrada/clone"}]
  end

end
