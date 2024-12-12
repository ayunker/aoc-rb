require "pry"

module Day08
  module_function

  def input
    File.readlines("./input/2024/08.txt", chomp: true)
  end

  def test_input
    File.readlines("./input/2024/08-test.txt", chomp: true)
  end

  Node = Data.define(:x, :y, :dim) do
    def wektor_to(other)
      [other.x - x, other.y - y]
    end

    def anti_node_from(other)
      a, b = wektor_to(other)
      Node[x: x - a, y: y - b, dim: dim]
    end

    def inbounds?
      (0...dim).cover?(x) &&
        (0...dim).cover?(y)
    end
  end

  def parsed_input(test = false)
    put = test ? test_input : input
    put.map { _1.chars }
  end

  def build_nodes(grid)
    dim = grid.length
    nodes = Hash.new { |h, k| h[k] = [] }
    grid.each.with_index do |row, i|
      row.each.with_index do |col, j|
        next if col == "."
        nodes[col] << Node[x: i, y: j, dim:]
      end
    end
    nodes
  end

  def part1(test = false)
    grid = parsed_input(test)
    nodes = build_nodes(grid)

    # NOTE: we can jus pass acc in here as the accumulator for the recursive function!
    # it's terser but it's a bit confusing, gonna leave it like this here,
    # but in part 2 will leave it the old way which may be clearer?
    anti_nodes = nodes.reduce(Set.new) do |acc, (name, noes)|
      recurze(noes, acc)
    end

    anti_nodes.count
  end

  def recurze(nodes, acc)
    if nodes.size == 1
      acc
    else
      node, *others = nodes
      others.map do |other|
        nn1 = node.anti_node_from(other)
        nn2 = other.anti_node_from(node)

        acc << nn1 if nn1.inbounds?
        acc << nn2 if nn2.inbounds?
      end

      recurze(others, acc)
    end
  end

  # ---

  def part2(test = false)
    grid = parsed_input(test)
    nodes = build_nodes(grid)

    anti_nodes = nodes.reduce(Set.new) do |acc, (name, noes)|
      acc.merge(recurze_2(noes, Set.new))
    end

    anti_nodes.count
  end

  def recurze_2(nodes, acc)
    if nodes.size == 1
      acc
    else
      node, *others = nodes
      others.map do |other|
        a, b = node.wektor_to(other)
        c, d = other.wektor_to(node)

        acc << node
        acc << other

        acc.merge(resonance_of(node, a, b))
        acc.merge(resonance_of(other, c, d))
      end

      recurze_2(others, acc)
    end
  end

  def resonance_of(node, a, b)
    accum = Set.new
    while node.inbounds?
      accum << node
      node = Node[x: node.x - a, y: node.y - b, dim: node.dim]
    end
    accum
  end
end
