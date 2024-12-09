require "pry"
require "matrix"

module Day06
  module_function

  def input
    File.readlines("./input/2024/06.txt", chomp: true)
  end

  def test_input
    File.readlines("./input/2024/06-test.txt", chomp: true)
  end

  def parsed_input(test = false)
    put = test ? test_input : input
    rows_of_rows = put.map { _1.split("") }
    mat = Matrix.rows(rows_of_rows)
    [mat, mat.find_index("^")]
  end

  State = Data.define(:grid, :loc, :direction) do
    def next_step
      case direction
      when :up
        [loc.first - 1, loc.last]
      when :down
        [loc.first + 1, loc.last]
      when :left
        [loc.first, loc.last - 1]
      when :right
        [loc.first, loc.last + 1]
      end
    end

    def next_dir
      return direction unless turn?
      case direction
      when :up
        :right
      when :right
        :down
      when :down
        :left
      when :left
        :up
      end
    end

    def exit?
      next_step.first < 0 ||
        next_step.last < 0 ||
        grid[next_step.first, next_step.last].nil?
    end

    def turn?
      grid[next_step.first, next_step.last] == "#"
    end

    def turn_step
      case next_dir
      when :up
        [loc.first - 1, loc.last]
      when :down
        [loc.first + 1, loc.last]
      when :left
        [loc.first, loc.last - 1]
      when :right
        [loc.first, loc.last + 1]
      end
    end

    def next_spot
      turn? ? loc : next_step
    end
  end

  def locations_visited(grid, starting_point)
    not_exited = true
    locations_visited = Set.new
    locations_visited << starting_point

    state = State[grid:, loc: starting_point, direction: :up]

    while not_exited
      not_exited = !state.exit?
      locations_visited << state.loc
      state = State[grid:, loc: state.next_spot, direction: state.next_dir]
    end

    locations_visited
  end

  def part1(test = false)
    grid, starting_point = parsed_input(test)

    locations_visited(grid, starting_point).count
  end

  def part2(test = false)
    grid, starting_point = parsed_input(test)

    lv = locations_visited(grid, starting_point)
    lv.map do |x, y|
      gg = grid.dup
      gg[x, y] = "#"

      cyclic?(gg, starting_point)
    end.count { |x| x }
  end

  def cyclic?(grid, starting_point)
    # aka locations_visited_redux
    not_exited = true
    locations_visited = Set.new
    locations_visited << [starting_point, :up]

    state = State[grid:, loc: starting_point, direction: :up]

    while not_exited
      not_exited = !state.exit?
      locations_visited << [state.loc, state.direction]
      state = State[grid:, loc: state.next_spot, direction: state.next_dir]

      if not_exited && locations_visited.include?([state.loc, state.direction])
        return true
      end
    end

    false
  end
end
