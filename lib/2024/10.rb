require "pry"

module Day10
  module_function

  Loc = Data.define(:x, :y, :grid, :size) do
    def val = grid[x][y]

    def succ = val + 1

    def neighbors
      ns = []
      ns << Loc[x: x - 1, y:, grid:, size:] if x - 1 >= 0
      ns << Loc[x: x + 1, y:, grid:, size:] if x + 1 < size
      ns << Loc[x: x, y: y - 1, grid:, size:] if y - 1 >= 0
      ns << Loc[x: x, y: y + 1, grid:, size:] if y + 1 < size
      ns
    end

    def neighbor_succ = neighbors.select { _1.val == succ }
  end

  def input
    File.readlines("./input/2024/10.txt", chomp: true)
  end

  def test_input
    File.readlines("./input/2024/10-test.txt", chomp: true)
  end

  def parsed_input(test = false)
    put = test ? test_input : input
    put.map { _1.chars.map(&:to_i) }
  end

  def part1(test = false)
    grid = parsed_input(test)
    size = grid.size

    get_trailheads(grid, size)
      .map { paths_from(_1, grid, size) }
      .sum
  end

  def part2(test = false)
    grid = parsed_input(test)
    size = grid.size

    get_trailheads(grid, size)
      .map { paths_from(_1, grid, size, true) }
      .sum
  end

  def get_trailheads(grid, size)
    trailheads = []
    grid.each_with_index do |line, i|
      line.each_index { trailheads << Loc[x: i, y: _1, grid:, size:] if line[_1] == 0 }
    end
    trailheads
  end

  def paths_from(trailhead, grid, size, unique = false)
    constituents = [trailhead]
    visited = Set.new

    counter = 0
    while constituents.any?
      loc = constituents.shift
      next if !unique && visited.include?(loc)
      visited << loc
      counter += 1 if loc.val == 9
      constituents.concat(loc.neighbor_succ)
    end
    counter
  end
end
