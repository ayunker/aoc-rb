require "pry"

module Day02
  module_function

  def input
    File.readlines("./input/2024/02.txt", chomp: true)
  end

  def test_input
    File.readlines("./input/2024/02-test.txt", chomp: true)
  end

  def parsed_input(test = false)
    put = test ? test_input : input
    put.map { |l| l.split(/\s+/).map(&:to_i) }
  end

  def part1(test = false)
    input = parsed_input(test)
    monotonics = input.select { monotonic?(_1) }

    monotonics.count { gradual?(_1) }
  end

  def part2(test = false)
    input = parsed_input(test)

    input.count { validate2(_1) }
  end

  def validate2(line)
    return true if monotonic?(line) && gradual?(line)

    line.size.times do |i|
      arr = line.dup
      arr.delete_at(i)
      return true if monotonic?(arr) && gradual?(arr)
    end
    false
  end

  def monotonic?(arr)
    return false if arr.length != arr.uniq.length
    sorted = arr.sort
    arr == sorted || arr == sorted.reverse
  end

  def gradual?(arr)
    arr.each_cons(2).map { (_2 - _1).abs }.all? { (1..3) === _1 }
  end
end
