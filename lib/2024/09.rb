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
    disk = parsed_input(test)

    starter = 0
    ender = disk.size

    loop do
      end_index = nil
      if disk[starter] == "."
        end_index = (ender - 1).downto(starter + 1).select { disk[_1] != "." }.first
        break if end_index.nil?
        disk[starter], disk[end_index] = disk[end_index], "."
      end

      starter += 1
      ender = end_index if end_index
      break if starter >= ender
    end

    checksum(disk)
  end

  def checksum(arr)
    arr.map.with_index do |x, i|
      x.to_i * i
    end.sum
  end

  def part2(test = false)
    put = parsed_input(test)
    put.reverse!
    chunked = put.chunk_while { |i, j| i == j }
    tally = put.tally

    binding.pry
  end
end
