module Day04
  module_function

  def input
    File.readlines("./input/2023/04.txt", chomp: true)
  end

  def test_input
    File.readlines("./input/2023/04-test.txt", chomp: true)
  end

  def parsed_input
    input.map do |line|
      card_string, rest = line.split(":")
      winning_nums, my_nums = rest.split("|")

      {
        card: card_string.split(" ").last.to_i,
        winning: winning_nums.split(" ").map(&:to_i),
        mine: my_nums.split(" ").map(&:to_i)
      }
    end
  end

  def part1
    parsed_input
      .map { |x| (x[:winning] & x[:mine]).size }
      .filter_map { |x| 2.pow(x - 1) if x > 0 }
      .reduce(:+)
  end

  def part2
    counter = Hash.new { |h, k| h[k] = 0 }

    parsed_input.each do |x|
      winning_size = (x[:winning] & x[:mine]).size
      further = (x[:card] + 1..x[:card] + winning_size).to_a
      further.each do |y|
        counter[y] = counter[y] + (counter[x[:card]] + 1)
      end
    end
    parsed_input.length + counter.values.reduce(:+)
  end
end
