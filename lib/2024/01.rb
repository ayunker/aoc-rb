require "pry"

module Day01
  module_function

  def input
    File.readlines("./input/2024/01.txt", chomp: true)
  end

  def test_input
    File.readlines("./input/2024/01-test.txt", chomp: true)
  end

  def parsed_input(test = false)
    put = test ? test_input : input
    put.map { |x| x.split(/\s+/) }
  end

  def part1(test = false)
    put = parsed_input(test)
    left = []
    right = []
    put.map { |a, b|
      left << a.to_i
      right << b.to_i
    }

    left.sort!
    right.sort!

    distances = left.map.with_index do |x, i|
      (x - right[i]).abs
    end

    distances.sum
  end

  def part2(test = false)
    put = parsed_input(test)
    left = []
    right = []
    put.map { |a, b|
      left << a.to_i
      right << b.to_i
    }

    tallied_right = right.tally
    left.map { |x| x * (tallied_right[x] || 0) }.sum
  end
end
