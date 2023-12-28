require "pry"
require "matrix"

module Day14
  module_function

  def input
    File.readlines("./input/2023/14.txt", chomp: true)
  end

  def test_input
    File.readlines("./input/2023/14-test.txt", chomp: true)
  end

  def parsed_input(test = false)
    put = test ? test_input : input
    put
      .map { _1.tr("O", "1").tr(".", "0").chars }
      .transpose
      .map { _1.join("") }
      .reverse
  end

  def part1(test = false)
    put = parsed_input(test)
    length = put.first.length
    slided = slide(put, length)
    calc_load(slided, length)
  end

  def part2(test = false)
    put = parsed_input(test)
    length = put.first.length
    cycled = put
    1_000_000_000.times { cycled = cycle(cycled, length) }
    calc_load(cycled, length)
  end

  def cycle(grid, length)
    3.times do
      grid = slide(grid, length)
      grid = rotate(grid)
    end
    grid
  end

  def rotate(grid)
    grid.map(&:chars).transpose.reverse.map { _1.join("") }
    # m = Matrix[*grid.map(&:chars)]
    # rotated = m.rotate_entries(:clockwise)
    # rotated.to_a.map { _1.join("") }
  end

  def slide(grid, length)
    grid.map do |x|
      x
        .split("#")
        .map(&:chars)
        .map(&:sort)
        .map(&:reverse)
        .map { _1.join("") }
        .join("#")
        .ljust(length, "#")
    end
  end

  def calc_load(grid, length)
    grid.map do |row|
      row
        .chars
        .map(&:to_i)
        .map.with_index { |x, i| x * (length - i) }
        .reduce(:+)
    end.reduce(:+)
  end
end
