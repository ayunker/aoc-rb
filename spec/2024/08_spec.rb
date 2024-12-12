require "./lib/2024/08"

RSpec.describe "Day 8: Title" do
  let(:day_mod) { Object.const_get(:Day08) }

  context "test input" do
    describe "Part One" do
      it do
        expect(day_mod.part1(true)).to eq 14
      end

      it do
        expect(day_mod.part2(true)).to eq 34
      end
    end
  end

  describe "Part One" do
    it do
      expect(day_mod.part1).to eq 293
    end
  end

  describe "Part Two" do
    it do
      expect(day_mod.part2).to eq 934
    end
  end
end
