require "./lib/2024/10"

RSpec.describe "Day 10: Title" do
  let(:day_mod) { Object.const_get(:Day10) }

  context "test input" do
    describe "Part One" do
      it do
        expect(day_mod.part1(true)).to eq 36
      end

      it do
        expect(day_mod.part2(true)).to eq 81
      end
    end
  end

  describe "Part One" do
    it do
      expect(day_mod.part1).to eq 552
    end
  end

  describe "Part Two" do
    it do
      expect(day_mod.part2).to eq 1225
    end
  end
end
