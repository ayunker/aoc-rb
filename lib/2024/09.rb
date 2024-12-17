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
    put.first.chars.map.with_index do |x, i|
      id_no = i.even? ? (i / 2).to_s : "."
      x.to_i.times.map { id_no }
    end.flatten
  end

  def part1(test = false)
    disk_map = parsed_input(test)
    acc = []

    while still_to_go?(disk_map)
      head = disk_map.shift

      if head == "."
        end_index = disk_map.rindex { _1 != "." }

        next if end_index.nil?

        end_value = disk_map[end_index]
        disk_map[end_index] = "."
        acc << end_value
      else
        acc << head
      end
    end

    checksum(acc)
  end

  def still_to_go?(disk_map)
    _, *rest = disk_map
    rest.any?(".")
  end

  def checksum(arr)
    arr.map.with_index do |x, i|
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
