require "./lib/2023/14"

RSpec.describe "Day 14: Title" do
  let(:day_mod) { Object.const_get(:Day14) }

  context "test input" do
    describe "Part One" do
      it do
        expect(day_mod.part1(true)).to eq 136
      end

      xit do
        expect(day_mod.part2(true)).to eq 64
      end
    end
  end

  describe "Part One" do
    it do
      expect(day_mod.part1).to eq 109098
    end
  end

  xdescribe "Part Two" do
    it do
      expect(day_mod.part2).to eq false
    end
  end
end
