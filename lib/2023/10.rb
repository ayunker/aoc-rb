require "pry"

module Day10
  module_function

  TILES = {
    "-" => [[0, -1], [0, 1]],
    "|" => [[-1, 0], [1, 0]],
    "7" => [[0, -1], [1, 0]],
    "J" => [[-1, 0], [0, -1]],
    "L" => [[-1, 0], [0, 1]],
    "F" => [[1, 0], [0, 1]]
  }

  def input
    File.readlines("./input/2023/10.txt", chomp: true)
  end

  def test_input
    File.readlines("./input/2023/10-test.txt", chomp: true)
  end

  def parsed_input(test = false)
    put = test ? test_input : input
    grid = put.map { |x| x.chars }
    starting_point = grid
      .map { |x| x.index("S") }
      .map.with_index { |x, i| [i, x] unless x.nil? }
      .compact.flatten

    {
      grid:,
      starting_point:
    }
  end

  def part1(test = false)
    parsed_input(test) => {grid:, starting_point:}
    paths = starting_directions(grid, starting_point)

    path1 = [starting_point]
    path2 = [starting_point]

    path1.unshift(paths.first)
    path2.unshift(paths.last)

    until path1.first == path2.first
      path1_next = next_step(path1[1], path1[0], grid[path1[0].first][path1[0].last])
      path2_next = next_step(path2[1], path2[0], grid[path2[0].first][path2[0].last])

      path1.unshift(path1_next)
      path2.unshift(path2_next)
    end

    path1.size - 1
  end

  def part2(test = false)
  end

  def next_step(previous, current, tile)
    outs = TILES[tile].map do |x|
      [current.first + x.first, current.last + x.last]
    end

    outs.detect { |x| x != previous }
  end

  def starting_directions(grid, starting_point)
    # [[2, 1], [1, 2]]
    # [[3, 0], [2, 1]]
    [[52, 99], [52, 101]]
    # a_start = [starting_point.first - 1, 0].max
    # a_end = [starting_point.first + 1, grid.size - 1].min
    # b_start = [starting_point.last - 1, 0].max
    # b_end = [starting_point.last + 1, grid[0].size - 1].min
    #
    # (a_start..a_end)
  end
end
