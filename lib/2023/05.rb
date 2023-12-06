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
    # parsed_input => { seeds:, maps: }
    seeds = parsed_input[:seeds]
    @maps = parsed_input[:maps]

    # map_seed_soil = Mapper.new(ranges_for(maps, "seed"))
    # map_soil_fertilizer = Mapper.new(ranges_for(maps, "soil"))
    # map_fertilizer_water = Mapper.new(ranges_for(maps, "fertilizer"))
    # map_water_light = Mapper.new(ranges_for(maps, "water"))
    # map_light_temperature = Mapper.new(ranges_for(maps, "light"))
    # map_temperature_humidity = Mapper.new(ranges_for(maps, "temperature"))
    # map_humidity_location = Mapper.new(ranges_for(maps, "humidity"))

    seeds.map do |seed|
      location_for_seed(seed)
    end.min
  end

  def part2
    # parsed_input => { seeds:, maps: }
    seeds = parsed_input[:seeds]
    @maps = parsed_input[:maps]

    # too_many = seeds.each_slice(2).to_a.map { |x| (x.first..(x.first + x.last)).to_a }.reduce(:|)
    binding.pry

    mins = []
    s, e = intervals[9]
    diff = (e - s) / 1000
    locs = (0..1000).map do |x|
      seed = s + (x * diff)
      [seed, location_for_seed(seed)]
    end
    sorted_locs = locs.sort_by(&:last)
    lowest_seed = sorted_locs[0].first
    lower_bound = [lowest_seed - diff, s].max
    upper_bound = [lowest_seed + diff, e].min
    mins << (lower_bound..upper_bound).map { |x| location_for_seed(x) }.min

    intervals = [[4188359137, 4225878710],
      [3736161691, 3908507817],
      [2590035450, 2656482041],
      [209124047, 315702927],
      [1404892542, 1434962533],
      [3014689843, 3132116388],
      [2169439765, 2395765257],
      [1511958436, 1689302766],
      [1822605035, 1873630145],
      [382778843, 1206777369]]
  end

  def ranges_for(maps, from)
    maps
      .detect { |x| x[:from] == from }[:dicts]
      .map { |y| [y[:source_start], y[:destination_start], y[:length]] }
      .map { |x| Ranger.new(*x) }
  end

  def location_for_seed(seed)
    t1 = map_seed_soil[seed]
    t2 = map_soil_fertilizer[t1]
    t3 = map_fertilizer_water[t2]
    t4 = map_water_light[t3]
    t5 = map_light_temperature[t4]
    t6 = map_temperature_humidity[t5]
    map_humidity_location[t6]
  end

  def map_seed_soil = @map_seed_soil ||= Mapper.new(ranges_for(@maps, "seed"))

  def map_soil_fertilizer = @map_soil_fertilizer ||= Mapper.new(ranges_for(@maps, "soil"))

  def map_fertilizer_water = @map_fertilizer_water ||= Mapper.new(ranges_for(@maps, "fertilizer"))

  def map_water_light = @map_water_light ||= Mapper.new(ranges_for(@maps, "water"))

  def map_light_temperature = @map_light_temperature ||= Mapper.new(ranges_for(@maps, "light"))

  def map_temperature_humidity = @map_temperature_humidity ||= Mapper.new(ranges_for(@maps, "temperature"))

  def map_humidity_location = @map_humidity_location ||= Mapper.new(ranges_for(@maps, "humidity"))
end

# puts Day05.part2
