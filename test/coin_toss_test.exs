defmodule CoinTossTest do
  use ExUnit.Case
  doctest CoinToss

  test "greets the world" do
    assert CoinToss.hello() == :world
  end
end
