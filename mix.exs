defmodule Pinyin.Mixfile do
  use Mix.Project

  def project do
    [app: :pinyin,
     version: "0.0.2",
     elixir: "~> 1.0",
     description: description,
     package: package,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: []]
  end

  defp description do
    """
    Pinyin module for Elixir.
    """
  end

  defp deps do
    [
      { :uni2pinyin, git: "https://github.com/mihawk/uni2pinyin.git" }
    ]
  end

  defp package do
    [# These are the default files included in the package
     files: ["lib", "mix.exs", "README*", "LICENSE*"],
     contributors: ["seagull", "HanHor"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/Hor/epinyin",
              "Docs" => "http://github.com/Hor/upyun-elixir"}]
  end
end
