defmodule Pinyin.Mixfile do
  use Mix.Project

  def project do
    [app: :mpinyin,
     version: "0.0.1",
     elixir: "~> 1.0",
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: []]
  end

  defp deps do
    [
      { :uni2pinyin, git: "https://github.com/mihawk/uni2pinyin.git" }
    ]
  end
end
