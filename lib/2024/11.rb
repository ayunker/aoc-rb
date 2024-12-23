require "pry"
require "bigdecimal"

module Day11
  module_function

  def input
    File.readlines("./input/2024/11.txt", chomp: true)
  end

  def test_input
    File.readlines("./input/2024/11-test.txt", chomp: true)
  end

  def parsed_input(test = false)
    put = test ? test_input : input
    put.first.split(/\s+/).map(&:to_i)
  end

  def part1(test = false)
    stones = parsed_input(test)

    stones.sum do |stone|
      split(stone, 25)
    end
  end

  def part2(test = false)
    stones = parsed_input(test)

    stones.sum do |stone|
      split(stone, 75)
    end
  end

  # ---

  CACHE = {}

  def split(stone, n)
    return 1 if n == 0

    CACHE[[stone, n]] ||= if stone == 0
      split(1, n - 1)
    elsif stone.to_s.size % 2 == 0
      factor = 10**(stone.to_s.size / 2)
      split(stone / factor, n - 1) + split(stone % factor, n - 1)
    else
      split(stone * 2024, n - 1)
    end
  end
end
