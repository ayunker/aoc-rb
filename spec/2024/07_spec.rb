require "./lib/2024/07"

RSpec.describe "Day 7: Title" do
  let(:day_mod) { Object.const_get(:Day07) }

  context "test input" do
    describe "Part One" do
      it do
        expect(day_mod.part1(true)).to eq 3749
      end

      it do
        expect(day_mod.part2(true)).to eq 11387
      end
    end
  end

  describe "Part One" do
    it do
      expect(day_mod.part1).to eq 1611660863222
    end
  end

  describe "Part Two" do
    it do
      expect(day_mod.part2).to eq 945341732469724
    end
  end
end
