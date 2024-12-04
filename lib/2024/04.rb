require "pry"
require "matrix"

module Day04
  module_function

  def input
    File.readlines("./input/2024/04.txt", chomp: true)
  end

  def test_input
    File.readlines("./input/2024/04-test.txt", chomp: true)
  end

  def parsed_input(test = false)
    put = test ? test_input : input
    put.map { |line| line.chars }
  end

  def part1(test = false)
    put = parsed_input(test)

    horizontal = put.map { _1.join("") }
    vertical = put.transpose.map { _1.join("") }
    diagonal_lr = diagonal_lr(put).map { _1.join("") }
    diagonal_rl = diagonal_lr(reflect(put)).map { _1.join("") }

    [horizontal, vertical, diagonal_lr, diagonal_rl].sum { counter(_1) }
  end

  def part2(test = false)
    grid = parsed_input(test)
    rows = grid.size
    cols = grid.first.size

    potential_xmases = grid.map.with_index do |line, j|
      next if j > rows - 3
      line.map.with_index do |x, i|
        next if i > cols - 3
        construct_matrix(grid, i, j) if ["M", "S"].include?(x)
      end
    end.flatten.compact

    potential_xmases.count { xmas?(_1) }
  end

  # --- Part 1 helpers

  def counter(grid)
    grid.sum do |row|
      row.scan("XMAS").count + row.scan("SAMX").count
    end
  end

  def diagonal_lr(grid)
    first = Matrix.rows(grid).map(:diagonal).to_a

    lower_half = reduced_grids(grid)
    upper_half = reduced_grids(grid.transpose)

    [first].concat(lower_half, upper_half)
  end

  def reduced_grids(grid)
    max = grid.first.length

    (1..max - 1).map do |x|
      reduced_grid = grid[x..max].map { |y| y[0..max - x] }
      Matrix.rows(reduced_grid).map(:diagonal).to_a
    end
  end

  def reflect(grid)
    grid.map do |line|
      line.reverse
    end
  end

  # --- Part 2 helpers

  def xmas?(matrix)
    matrix[1, 1] == "A" &&
      [matrix.map(:diagonal).to_a.sort,
        matrix.rotate_entries(:counter_clockwise).map(:diagonal).to_a.sort].all? { _1 == ["A", "M", "S"] }
  end

  def construct_matrix(grid, i, j)
    row1 = grid[j].slice(i..i + 2)
    row2 = grid[j + 1].slice(i..i + 2)
    row3 = grid[j + 2].slice(i..i + 2)

    Matrix.rows([row1, row2, row3])
  end
end
