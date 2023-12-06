require "./lib/2023/05"

RSpec.describe "Day 5: Title" do
  let(:day_mod) { Object.const_get(:Day05) }

  context "test input" do
    describe "Part One" do
    end

    describe "Part Two" do
    end
  end

  describe "Part One" do
    it "is correct" do
      expect(day_mod.part1).to eq 26273516
    end
  end

  describe "Part Two" do
    it "is correct" do
      expect(day_mod.part2).to eq false
    end
  end
end
