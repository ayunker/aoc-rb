require "./lib/2023/09"

RSpec.describe "Day 9: Title" do
  let(:day_mod) { Object.const_get(:Day09) }

  describe "#recurs" do
    it do
      expect(day_mod.extrapolate([0, 3, 6, 9, 12, 15])).to eq 18
      expect(day_mod.extrapolate([1, 3, 6, 10, 15, 21])).to eq 28
      expect(day_mod.extrapolate([10, 13, 16, 21, 30, 45])).to eq 68
    end
  end

  context "test input" do
    describe "Part One" do
      it do
        expect(day_mod.part1(true)).to eq 114
      end

      it do
        expect(day_mod.part2(true)).to eq 2
      end
    end
  end

  describe "Part One" do
    it do
      expect(day_mod.part1).to eq 1725987467
    end
  end

  describe "Part Two" do
    it do
      expect(day_mod.part2).to eq 971
    end
  end
end
