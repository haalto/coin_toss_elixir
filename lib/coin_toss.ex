defmodule GameState do
  defstruct heads: 0, tails: 0, tosses: 0
end

defmodule CoinToss do
  def toss do
    case :rand.uniform(2) do
      1 -> "Heads"
      2 -> "Tails"
    end
  end

  def mainLoop(game_state) do
    IO.puts("Tossing a coin...")
    result = toss()
    IO.puts("You got #{result}")

    new_game_state =
      case result do
        "Heads" -> %{game_state | heads: game_state.heads + 1, tosses: game_state.tosses + 1}
        "Tails" -> %{game_state | tails: game_state.tails + 1, tosses: game_state.tosses + 1}
      end

    IO.puts(
      "#{game_state.tosses} tosses so far, with #{game_state.heads} heads and #{game_state.tails} tails"
    )

    IO.gets("Toss again? (y/n)")
    |> String.trim()
    |> String.upcase()
    |> case do
      "Y" ->
        mainLoop(new_game_state)

      _ ->
        IO.puts("Bye!")
    end
  end

  def start do
    game_state = %GameState{}
    mainLoop(game_state)
  end
end
