require "./lib/2023/04"

RSpec.describe "Day 4: Title" do
  let(:day_mod) { Object.const_get(:Day04) }

  context "test input" do
    describe "Part One" do
    end

    describe "Part Two" do
    end
  end

  describe "Part One" do
    it "is correct" do
      expect(day_mod.part1).to eq 27454
    end
  end

  describe "Part Two" do
    it "is correct" do
      expect(day_mod.part2).to eq 6857330
    end
  end
end
