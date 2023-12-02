module Day01
  module_function

  def input
    File.readlines("./input/2023/01.txt", chomp: true)
  end

  def test_input
    File.readlines("./input/2023/01-test.txt", chomp: true)
  end

  def part1(override: nil)
    (override || input)
      .map { |i| i.gsub(/[a-z]/, "") }
      .map { |x| x.chars.map(&:to_i) }
      .map { |x| (x.first * 10) + x.last }
      .reduce(:+)
  end

  def part1_alt(override: nil)
    (override || input)
      .map { |x| (x[x.index(/\d/)].to_i * 10) + x[x.rindex(/\d/)].to_i }
      .reduce(:+)
  end

  def part2
    transformed = input.each { |i| Day01.string_to_nums.each { |k, v| i.gsub!(k, v) } }
    part1(override: transformed)
  end

  def part2_alt
    transformed = input.each { |i| Day01.string_to_nums.each { |k, v| i.gsub!(k, v) } }
    part1_alt(override: transformed)
  end

  def reg
    /(one|two|three|four|five|six|seven|eight|nine)/
  end

  def string_to_nums
    [["one", "o1e"],
      ["eight", "e8t"],
      ["two", "t2o"],
      ["three", "t3e"],
      ["four", "f4r"],
      ["five", "f5e"],
      ["six", "s6x"],
      ["seven", "s7n"],
      ["nine", "n9e"]].to_h
  end
end
