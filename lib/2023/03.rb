require "pry"

module Day03
  module_function

  SPECIAL_CHARS = ["@", "/", "=", "-", "#", "$", "%", "&", "*", "+"]

  def input
    File.readlines("./input/2023/03.txt", chomp: true)
  end

  def test_input
    File.readlines("./input/2023/03-test.txt", chomp: true)
  end

  def parsed_input
    input.map { |x| x.chars }
  end

  def part1
    product_numbers = []
    input.each_with_index do |line, i|
      nums_with_index = []
      line.scan(/(\d+)/) do |x|
        nums_with_index << [x.first, $~.offset(0)[0]]
      end

      thing = nums_with_index.filter_map do |n, j|
        puts "number: #{n}"
        n unless (neighbors(j, j + n.length, i) & SPECIAL_CHARS).empty?
      end
      product_numbers << thing unless thing.empty?
    end
    puts "product numbers: #{product_numbers.flatten}"
    puts "product numbers: #{product_numbers.flatten.map(&:to_i).reduce(:+)}"
  end

  def part2
    gears = Hash.new { |h, k| h[k] = [] }

    input.each_with_index do |line, i|
      nums_with_index = []
      line.scan(/(\d+)/) do |x|
        nums_with_index << [x.first, $~.offset(0)[0]]
      end

      nums_with_index.each do |n, j|
        # puts "number: #{n}"
        neighboring_stars(j, j + n.length, i).each do |a, b|
          gears[[a, b]] << n
        end
      end
    end
    gears.select { |k, v| v.length == 2 }.map { |k, v| v.map(&:to_i).reduce(:*) }.reduce(:+)
  end

  def neighboring_stars(x_start, x_end, y)
    xs = (x_start == 0) ? 0 : x_start - 1
    ys = (y == 0) ? 0 : y - 1
    ye = (y == parsed_input.length - 1) ? y : y + 1

    [ys, y, ye].product((xs..x_end).to_a).filter_map do |a, b|
      [a, b] if parsed_input[a][b] == "*"
    end
  end

  def neighbors(x_start, x_end, y)
    xs = (x_start == 0) ? 0 : x_start - 1
    ys = (y == 0) ? 0 : y - 1
    ye = (y == parsed_input.length - 1) ? y : y + 1

    [ys, y, ye].product((xs..x_end).to_a).map do |a, b|
      parsed_input[a][b]
    end
  end
end
