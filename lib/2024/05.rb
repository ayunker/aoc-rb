require "pry"

module Day05
  module_function

  def input
    File.readlines("./input/2024/05.txt", chomp: true)
  end

  def test_input
    File.readlines("./input/2024/05-test.txt", chomp: true)
  end

  def parsed_input(test = false)
    put = test ? test_input : input
    splitter = put.find_index("")

    orderings = put[0..splitter - 1].map { _1.split("|").map(&:to_i) }
    updates = put[splitter + 1..].map { _1.split(",").map(&:to_i) }
    [orderings, updates]
  end

  def part1(test = false)
    orderings, updates = parsed_input(test)

    updates.map do |u|
      right_order?(u, orderings) ? middle_page(u) : 0
    end.sum
  end

  def part2(test = false)
    orderings, updates = parsed_input(test)

    ahead = orderings.each_with_object({}) { |x, acc| (acc[x[0]] ||= []) << x[1] }

    incorrects = updates.select { !right_order?(_1, orderings) }
    incorrects.map do |i|
      correct_order = sorter(i, ahead)
      middle_page(correct_order)
    end.sum
  end

  # ---

  def sorter(update, ahead)
    update.sort do |a, b|
      what = (ahead.key?(a) && ahead[a].include?(b)) ? -1 : 0
      who = (ahead.key?(b) && ahead[b].include?(a)) ? 1 : 0
      what + who
    end
  end

  def right_order?(update, orderings)
    orderings.all? do |first, second|
      o1 = update.index(first)
      o2 = update.index(second)
      valid?(o1, o2)
    end
  end

  def valid?(o1, o2)
    return true unless o1
    return true unless o2
    o1 < o2
  end

  def middle_page(update)
    update[update.length / 2]
  end
end
