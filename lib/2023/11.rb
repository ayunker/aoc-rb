require "pry"

module Day11
  module_function

  GALAXY = "#"

  def input
    File.readlines("./input/2023/11.txt", chomp: true)
  end

  def test_input
    File.readlines("./input/2023/11-test.txt", chomp: true)
  end

  def parsed_input(test = false)
    put = test ? test_input : input
    put.map(&:chars)
  end

  def part1(test = false)
    @grid = parsed_input(test)

    galaxies.combination(2)
      .map { |a, b| manhanced_dist(a, b, 1) }
      .reduce(:+)
  end

  def part2(test = false, factor = 999_999)
    @grid = parsed_input(test)

    galaxies.combination(2)
      .map { |a, b| manhanced_dist(a, b, factor) }
      .reduce(:+)
  end

  def manhanced_dist(a, b, factor)
    rows = [a.first, b.first].sort
    cols = [a.last, b.last].sort
    warp_rows = (rows.first..rows.last).to_a & empty_rows
    warp_cols = (cols.first..cols.last).to_a & empty_cols
    [manhattan_dist(a, b),
      (warp_rows.size * factor),
      (warp_cols.size * factor)].reduce(:+)
  end

  def manhattan_dist(a, b)
    [
      (a.first - b.first).abs,
      (a.last - b.last).abs
    ].reduce(:+)
  end

  def galaxies
    @galaxies ||= begin
      galaxies = []
      @grid.each_with_index do |x, i|
        x.each_with_index do |y, j|
          galaxies << [i, j] if y == GALAXY
        end
      end
      galaxies
    end
  end

  def empty_rows
    @empty_rows ||= @grid.filter_map.with_index { |x, i| i if x.all?(".") }
  end

  def empty_cols
    @empty_cols ||= (0..@grid.first.length - 1).to_a - @galaxies.map(&:last)
  end
end
