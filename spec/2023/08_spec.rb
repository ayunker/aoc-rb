require "./lib/2023/08"

RSpec.describe "Day 8: Title" do
  let(:day_mod) { Object.const_get(:Day08) }

  context "test input" do
    describe "Part One" do
    end

    describe "Part Two" do
    end
  end

  context "test input" do
    describe "Part One" do
      it do
        expect(day_mod.part1(true)).to eq 6
      end

      it do
        expect(day_mod.part2(true)).to eq 6
      end
    end
  end

  describe "Part One" do
    it do
      expect(day_mod.part1).to eq 13939
    end
  end

  describe "Part Two" do
    it do
      expect(day_mod.part2).to eq 8906539031197
    end
  end
end
