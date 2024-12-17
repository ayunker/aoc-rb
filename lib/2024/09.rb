require "pry"

module Day09
  module_function

  def input
    File.readlines("./input/2024/09.txt", chomp: true)
  end

  def test_input
    File.readlines("./input/2024/09-test.txt", chomp: true)
  end

  def parsed_input(test = false)
    put = test ? test_input : input
    binding.pry
    put.first.chars.map.with_index do |x, i|
      id_no = i.even? ? (i / 2).to_s : "."
      x.to_i.times.map { id_no }
    end.flatten
  end

  def part1(test = false)
    put = parsed_input(test)
    binding.pry
    what = recurze(put, [])
    what.map.with_index do |x, i|
      x.to_i * i
    end.sum
  end

  def recurze(disk_map, acc)
    head, *rest = disk_map
    if head == "."
      end_index = rest.rindex { _1 != "." }

      if end_index.nil?
        return acc
      end

      end_value = rest[end_index]
      rest[end_index] = "."

      recurze(rest, acc.push(end_value))
    else
      recurze(rest, acc.push(head))
    end
  end

  def part2(test = false)
    parsed_input(test)
  end
end
