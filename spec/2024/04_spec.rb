require "./lib/2024/04"

RSpec.describe "Day 4: Title" do
  let(:day_mod) { Object.const_get(:Day04) }

  context "test input" do
    describe "Part One" do
      it do
        expect(day_mod.part1(true)).to eq 18
      end

      it do
        expect(day_mod.part2(true)).to eq 9
      end
    end
  end

  describe "Part One" do
    it do
      expect(day_mod.part1).to eq 2_500
    end
  end

  describe "Part Two" do
    it do
      expect(day_mod.part2).to eq 1933
    end
  end
end
