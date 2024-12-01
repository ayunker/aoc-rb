require "./lib/2024/01"

RSpec.describe "Day 1: Title" do
  let(:day_mod) { Object.const_get(:Day01) }

  context "test input" do
    describe "Part One" do
    end

    describe "Part Two" do
    end
  end

  context "test input" do
    describe "Part One" do
      it do
        expect(day_mod.part1(true)).to eq 11
      end

      it do
        expect(day_mod.part2(true)).to eq 31
      end
    end
  end

  describe "Part One" do
    it do
      expect(day_mod.part1).to eq 2378066
    end
  end

  describe "Part Two" do
    it do
      expect(day_mod.part2).to eq 18934359
    end
  end
end
