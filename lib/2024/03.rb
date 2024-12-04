require "pry"

module Day03
  module_function

  def input
    File.readlines("./input/2024/03.txt", chomp: true)
  end

  def test_input
    File.readlines("./input/2024/03-test.txt", chomp: true)
  end

  def parsed_input(test = false)
    test ? test_input : input
  end

  def part1(test = false)
    lines = parsed_input(test)
    lines.sum do |line|
      line
        .scan(/mul\((\d+),(\d+)\)/)
        .sum { |a, b| a.to_i * b.to_i }
    end
  end

  def part2(test = false)
    lines = parsed_input(test)
    line = lines.join("")
    enabled = true
    what = line
      .scan(/mul\(\d+,\d+\)|do\(\)|don't\(\)/)
    what.map do |x|
      case x
      when "do()"
        enabled = true
        nil
      when "don't()"
        enabled = false
        nil
      when /mul\((\d+),(\d+)\)/
        $1.to_i * $2.to_i if enabled
      end
    end.compact.sum
  end
end
