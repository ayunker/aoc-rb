require "pry"
module Day05
  Mapper = Data.define(:ranges) do
    def next_value(x)
      ranges.map { |r| r[x] }.compact.first || x
    end

    def [](x)
      ranges.map { |r| r[x] }.compact.first || x
    end
  end
  Ranger = Data.define(:destination_start, :source_start, :length) do
    def include?(x)
      source_start <= x && x <= source_start + length
    end

    def next_value(x)
      destination_start + (x - source_start) if include?(x)
    end

    def [](x)
      destination_start + (x - source_start) if include?(x)
    end
  end

  module_function

  def input
    @input ||= File.readlines("./input/2023/05.txt", chomp: true)
  end

  def test_input
    @test_input ||= File.readlines("./input/2023/05-test.txt", chomp: true)
  end

  def parsed_input
    @parsed_input ||= begin
      seeds = nil
      maps = []
      what_input = input
      until what_input.empty?
        empter = what_input.index("")
        segment = what_input.shift(empter + 1)
        seeds = parse_seeds(segment) if segment.first.index("seeds:")
        maps << parse_map(segment) if segment.first.index("map")
      end
      {
        seeds:,
        maps:
      }
    end
  end

  def parse_map(segment)
    from_to_map = segment.first.match(/(\w+)-to-(\w+)/)

    dicts = segment[1, segment.length - 2].map do |x|
      dict = x.split(" ")
      {source_start: dict[0].to_i, destination_start: dict[1].to_i, length: dict[2].to_i}
    end

    {
      from: from_to_map[1],
      to: from_to_map[2],
      dicts:
    }
  end

  def parse_seeds(segment)
    segment.first.scan(/\d+/).map(&:to_i)
  end

  def tester
    mapper = Mapper.new([
      Ranger.new(50, 98, 2),
      Ranger.new(52, 50, 48)
    ])
  end

  def part1
    parsed_input => { seeds:, maps: }

    map_seed_soil = Mapper.new(ranges_for(maps, "seed"))
    map_soil_fertilizer = Mapper.new(ranges_for(maps, "soil"))
    map_fertilizer_water = Mapper.new(ranges_for(maps, "fertilizer"))
    map_water_light = Mapper.new(ranges_for(maps, "water"))
    map_light_temperature = Mapper.new(ranges_for(maps, "light"))
    map_temperature_humidity = Mapper.new(ranges_for(maps, "temperature"))
    map_humidity_location = Mapper.new(ranges_for(maps, "humidity"))

    seeds.map do |seed|
      t1 = map_seed_soil[seed]
      t2 = map_soil_fertilizer[t1]
      t3 = map_fertilizer_water[t2]
      t4 = map_water_light[t3]
      t5 = map_light_temperature[t4]
      t6 = map_temperature_humidity[t5]
      map_humidity_location[t6]
    end.min
  end

  def part2
    # parsed_input => { seeds:, maps: }

    map_seed_soil = Mapper.new(ranges_for(maps, "seed"))
    map_soil_fertilizer = Mapper.new(ranges_for(maps, "soil"))
    map_fertilizer_water = Mapper.new(ranges_for(maps, "fertilizer"))
    map_water_light = Mapper.new(ranges_for(maps, "water"))
    map_light_temperature = Mapper.new(ranges_for(maps, "light"))
    map_temperature_humidity = Mapper.new(ranges_for(maps, "temperature"))
    map_humidity_location = Mapper.new(ranges_for(maps, "humidity"))

    too_many = seeds.each_slice(2).to_a.map { |x| (x.first..(x.first + x.last)).to_a }.reduce(:|)

    too_many.map do |seed|
      t1 = map_seed_soil[seed]
      t2 = map_soil_fertilizer[t1]
      t3 = map_fertilizer_water[t2]
      t4 = map_water_light[t3]
      t5 = map_light_temperature[t4]
      t6 = map_temperature_humidity[t5]
      map_humidity_location[t6]
    end.min
  end

  def ranges_for(maps, from)
    maps
      .detect { |x| x[:from] == from }[:dicts]
      .map { |y| [y[:source_start], y[:destination_start], y[:length]] }
      .map { |x| Ranger.new(*x) }
  end
end

# puts Day05.part2
