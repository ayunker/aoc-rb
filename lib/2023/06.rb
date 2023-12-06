require "pry"

module Day06
  module_function

  def input
    File.readlines("./input/2023/06.txt", chomp: true)
  end

  def test_input
    File.readlines("./input/2023/06-test.txt", chomp: true)
  end

  def parsed_input(test = false)
    put = test ? test_input : input
    times = put.first.split(/\s+/)[1..].map(&:to_i)
    distances = put[1].split(/\s+/)[1..].map(&:to_i)
    times.zip(distances)
  end

  def part1
    races = parsed_input

    races.map do |race|
      time = race[0]
      distance = race[1]
      (1..time).map { |x| win_race?(time, distance, x) }.count { |x| x }
    end.reduce(:*)
  end

  def tester
    (0..7).map { |x| win_race?(7, 9, x) }
  end

  def part2
    races = parsed_input
    time = races.map { |x| x.first.to_s }.join("").to_i
    distance = races.map { |x| x.last.to_s }.join("").to_i

    (1..time).map { |x| win_race?(time, distance, x) }.count { |x| x }
  end

  def win_race?(duration, distance, charge)
    (charge * (duration - charge)) > distance
  end
end
