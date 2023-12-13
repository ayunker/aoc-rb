require "pry"

module Day09
  module_function

  def input
    File.readlines("./input/2023/09.txt", chomp: true)
  end

  def test_input
    File.readlines("./input/2023/09-test.txt", chomp: true)
  end

  def parsed_input(test = false)
    put = test ? test_input : input
    put.map { |x| x.split(/\s+/).map(&:to_i) }
  end

  def part1(test = false)
    parsed_input(test)
      .map { |x| extrapolate(x) }
      .reduce(:+)
  end

  def part2(test = false)
    parsed_input(test)
      .map(&:reverse)
      .map { |x| extrapolate(x) }
      .reduce(:+)
  end

  def extrapolate(arr)
    return 0 if arr.all?(&:zero?)
    arr.last + extrapolate(arr.each_cons(2).to_a.map { |a, b| b - a })
  end
end
