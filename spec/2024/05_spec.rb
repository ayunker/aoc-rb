require "./lib/2024/05"

RSpec.describe "Day 5: Title" do
  let(:day_mod) { Object.const_get(:Day05) }

  context "test input" do
    describe "Part One" do
      it do
        expect(day_mod.part1(true)).to eq 143
      end

      it do
        expect(day_mod.part2(true)).to eq 123
      end
    end
  end

  describe "Part One" do
    it do
      expect(day_mod.part1).to eq 5064
    end
  end

  describe "Part Two" do
    it do
      expect(day_mod.part2).to eq false
    end
  end
end
