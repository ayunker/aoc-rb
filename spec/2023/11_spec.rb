require "./lib/2023/11"

RSpec.describe "Day 11: Title" do
  let(:day_mod) { Object.const_get(:Day11) }

  xcontext "test input" do
    describe "Part One" do
    end

    describe "Part Two" do
    end
  end

  describe ".manhattan_dist" do
    it do
      expect(day_mod.manhattan_dist([6, 1], [11, 5])).to eq 9
      expect(day_mod.manhattan_dist([0, 4], [10, 9])).to eq 15
      expect(day_mod.manhattan_dist([2, 0], [7, 12])).to eq 17
      expect(day_mod.manhattan_dist([11, 0], [11, 5])).to eq 5
    end
  end

  context "test input" do
    describe "Part One" do
      xit do
        expect(day_mod.part1(true)).to eq 374
      end

      xit do
        expect(day_mod.part2(true, 99)).to eq 8410
      end
    end
  end

  describe "Part One" do
    it do
      expect(day_mod.part1).to eq 9805264
    end
  end

  describe "Part Two" do
    it do
      expect(day_mod.part2).to eq 779032247216
    end
  end
end
