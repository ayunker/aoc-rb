require "./lib/2023/10"

RSpec.describe "Day 10: Title" do
  let(:day_mod) { Object.const_get(:Day10) }

  context "test input" do
    describe "Part One" do
    end

    describe "Part Two" do
    end
  end

  describe ".next_step" do
    it do
      expect(day_mod.next_step([1, 1], [1, 2], "-")).to eq [1, 3]
      expect(day_mod.next_step([1, 2], [1, 3], "7")).to eq [2, 3]
      expect(day_mod.next_step([1, 3], [2, 3], "|")).to eq [3, 3]
      expect(day_mod.next_step([2, 3], [3, 3], "J")).to eq [3, 2]
      expect(day_mod.next_step([3, 2], [3, 1], "L")).to eq [2, 1]
    end
  end

  # describe ".starting_directions" do
  #   it do
  #     day_mod.parsed_input(true) => {grid:, starting_point:}
  #     expect(day_mod.starting_directions(grid, starting_point)).to match([[2, 1], [1, 2]])
  #   end
  # end

  context "test input" do
    describe "Part One" do
      xit do
        expect(day_mod.part1(true)).to eq 8
      end

      xit do
        expect(day_mod.part2(true)).to eq false
      end
    end
  end

  describe "Part One" do
    it do
      expect(day_mod.part1).to eq false
    end
  end

  xdescribe "Part Two" do
    it do
      expect(day_mod.part2).to eq false
    end
  end
end
