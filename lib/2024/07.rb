require "pry"

module Aoc7
  refine Integer do
    def cc(other)
      (to_s << other.to_s).to_i
    end
  end
end

module Day07
  module_function

  using Aoc7

  Operation = Data.define(:total, :elements)

  def input
    File.readlines("./input/2024/07.txt", chomp: true)
  end

  def test_input
    File.readlines("./input/2024/07-test.txt", chomp: true)
  end

  def parsed_input(test = false)
    put = test ? test_input : input
    put.map do |line|
      total, rest = line.split(":")
      Operation[total: total.to_i, elements: rest.split(/\s+/).map(&:to_i)[1..]]
    end
  end

  def part1(test = false)
    put = parsed_input(test)

    put.map do |op|
      op.total if recurze(op.total, [:+, :*], op.elements, 0)
    end.compact.sum
  end

  def part2(test = false)
    put = parsed_input(test)

    put.map do |op|
      op.total if recurze(op.total, [:+, :*, :cc], op.elements, 0)
    end.compact.sum
  end

  def recurze(total, ops, elements, partial)
    return false if partial > total

    if elements.size == 1
      ops.any? { |op| total == partial.send(op, elements.first) }
    else
      ops.any? do |op|
        recurze(total, ops, elements[1..], partial.send(op, elements.first))
      end
    end
  end
end
