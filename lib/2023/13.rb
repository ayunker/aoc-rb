require "pry"

module Day13
  module_function

  def input
    File.readlines("./input/2023/13.txt", chomp: true)
  end

  def test_input
    File.readlines("./input/2023/13-test.txt", chomp: true)
  end

  def parsed_input(test = false)
    put = test ? test_input : input

    result = []
    while (idx = put.index(""))
      result << put.shift(idx)
      put.shift
    end

    result << put
  end

  def part1(test = false)
    put = parsed_input(test)

    v_indices = []
    h_indices = []
    put.each do |grid|
      v_indices += partition_indices(grid)

      t_grid = grid.map(&:chars).transpose.map { _1.join("") }
      h_indices += partition_indices(t_grid)
    end

    [
      v_indices.map { _1 + 1 }.reduce(:+),
      h_indices.map { (_1 + 1) * 100 }.reduce(:+)
    ].reduce(:+)
  end

  def part2(test = false)
  end

  def partition_indices(grid)
    (0..grid.first.length - 1).select do |x|
      x if grid.all? { equal_at_partition?(_1, x) }
    end
  end

  def equal_at_partition?(row, idx)
    part1 = row[0..idx].reverse
    part2 = row[(idx + 1)..]
    argh = [part1.length, part2.length].min - 1
    what1 = part1[0..argh]
    what2 = part2[0..argh]
    what1 == what2
  end
end
