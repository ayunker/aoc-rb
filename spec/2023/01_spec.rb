require "./lib/2023/01"

RSpec.describe "Day 1: Title" do
  let(:day_mod) { Object.const_get(:Day01) }

  context "test input" do
    describe "Part One" do
    end

    describe "Part Two" do
    end
  end

  describe "Part One" do
    it "is correct" do
      expect(day_mod.part1).to eq 54634
    end
  end

  describe "Part Two" do
    it "is correct" do
      expect(day_mod.part2).to eq 53855
    end
  end
end
