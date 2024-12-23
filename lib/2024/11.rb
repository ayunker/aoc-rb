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
    put.first.split(/\s+/)
  end

  def part1(test = false)
    stones = parsed_input(test)
    blinks = 25
    blinks.times do
      stones = stones.map { split(_1) }.flatten
    end

    stones.size
  end

  def part2(test = false)
    stones = parsed_input(test)

    blinks = 75
    blinks.times do
      stones = stones.map { split(_1) }.flatten
    end

    stones.size
  end

  # ---

  def split(stone)
    istone = stone.to_i

    case true
    when istone == 0
      "1"
    when stone.size % 2 == 0
      factor = 10**(stone.size / 2)
      [istone / factor, istone % factor].map(&:to_s)
    else
      (istone * 2024).to_s
    end
  end
end
