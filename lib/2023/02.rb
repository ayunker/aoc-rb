module Day02
  module_function

  def input
    File.readlines("./input/2023/02.txt", chomp: true)
  end

  def test_input
    File.readlines("./input/2023/02-test.txt", chomp: true)
  end

  def parsed_input(put)
    put.each_with_object({}) do |x, acc|
      game, hands = x.split(":")
      game_num = game.split(" ").last

      parsed_hands = hands.split(";").map do |hand|
        hand.split(", ").map do |x|
          x.chomp.split(" ")
        end.each_with_object({}) do |a, accum|
          accum[a.last] = a.first
        end
      end

      acc[game_num] = parsed_hands
    end
  end

  def part1
    parsed_input(input).filter do |k, v|
      v.map do |hand|
        hand["red"].to_i <= valid_game[:red] &&
          hand["green"].to_i <= valid_game[:green] &&
          hand["blue"].to_i <= valid_game[:blue]
      end.all?
    end.keys.map(&:to_i).reduce(:+)
  end

  def part2
    parsed_input(input).values.map do |v|
      [
        v.map { |x| x["red"].to_i }.max,
        v.map { |x| x["green"].to_i }.max,
        v.map { |x| x["blue"].to_i }.max
      ].reduce(:*)
    end.reduce(:+)
  end

  def valid_game
    {
      red: 12,
      green: 13,
      blue: 14
    }
  end
end
