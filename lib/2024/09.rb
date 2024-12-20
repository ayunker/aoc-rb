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
    disk = parsed_input(test)
    tally = disk.tally

    what = tally.each_with_object({}) do |(k, v), acc|
      acc[k] = {size: v - 1, idx: disk.index(k)}
    end
    what.delete("0")
    what.delete(".")

    what.sort.reverse_each do |id_num, meta|
      empty = disk.index(".")
      # binding.pry if id_num == "7"
      next if empty.nil?
      loop do
        break if empty >= meta[:idx]
        # binding.pry if id_num == "7"
        if disk[empty..empty + meta[:size]].all?(".")
          # binding.pry if id_num == "7"

          empty.upto(empty + meta[:size]).each { disk[_1] = id_num }
          meta[:idx].upto(meta[:idx] + meta[:size]).each { disk[_1] = "." }
          break
        else
          search = (empty + 1).upto(disk.size).select { disk[_1] == "." }.first
          # binding.pry if id_num == "7"
          break if search.nil?
          empty = search
        end
      end
    end

    checksum(disk)
  end
end
