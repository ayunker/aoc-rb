require "./lib/2024/11"

RSpec.describe "Day 11: Title" do
  let(:day_mod) { Object.const_get(:Day11) }

  context "test input" do
    describe "Part One" do
      it do
        expect(day_mod.part1(true)).to eq 55312
      end

      it do
        expect(day_mod.part2(true)).to eq false
      end
    end
  end

  describe "Part One" do
    it do
      expect(day_mod.part1).to eq 228668
    end
  end

  describe "Part Two" do
    it do
      expect(day_mod.part2).to eq false
    end
  end
end
