require "pry"

module Day08
  module_function

  DIRS = {"L" => 0, "R" => 1}

  def input
    File.readlines("./input/2023/08.txt", chomp: true)
  end

  def test_input
    File.readlines("./input/2023/08-test.txt", chomp: true)
  end

  def test_input_part2
    File.readlines("./input/2023/08-test-2.txt", chomp: true)
  end

  def parsed_input(test = false, part2 = false)
    put = test ? test_input : input
    put = part2 ? test_input_part2 : put
    nodes = put[2..].each_with_object({}) do |x, acc|
      n, children = x.split(/\s=\s/)
      left, right = children.scan(/\w+/)
      acc[n] = [left, right]
    end

    {
      directions: put[0].chars,
      nodes:
    }
  end

  def part1(test = false)
    parsed_input(test) => {directions:, nodes: }
    @nodes = nodes

    # TODO: this bit could definitely be extracted. but i don't feel like it now
    n = "AAA"
    steps = 0

    while n != "ZZZ"
      stepper(directions, n, steps) => { steps:, n: }
    end

    steps
  end

  def part2(test = false)
    parsed_input(test, test) => {directions:, nodes: }
    @nodes = nodes
    starting_nodes = nodes.keys.select { |x| x[-1] == "A" }

    starting_nodes.each_with_object([]) do |x, acc|
      n = x
      steps = 0

      while n[-1] != "Z"
        stepper(directions, n, steps) => { steps:, n: }
      end

      acc << steps
    end.reduce(&:lcm)
  end

  def stepper(directions, n, steps)
    directions.each do |x|
      steps += 1
      n = nexter(n, x)
      break if n == "ZZZ"
    end
    {steps:, n:}
  end

  def nexter(node, dir)
    @nodes[node][DIRS[dir]]
  end
end
