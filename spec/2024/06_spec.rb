require "./lib/2024/06"

RSpec.describe "Day 6: Title" do
  let(:day_mod) { Object.const_get(:Day06) }

  context "test input" do
    describe "Part One" do
      it do
        expect(day_mod.part1(true)).to eq 41
      end

      it do
        expect(day_mod.part2(true)).to eq 6
      end
    end
  end

  describe "Part One" do
    it do
      expect(day_mod.part1).to eq 5444
    end
  end

  describe "Part Two" do
    it do
      expect(day_mod.part2).to eq 1946
    end
  end
end
