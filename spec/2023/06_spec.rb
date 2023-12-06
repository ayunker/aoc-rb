require "./lib/2023/06"

RSpec.describe "Day 6: Title" do
  let(:day_mod) { Object.const_get(:Day06) }

  context "test input" do
    describe "Part One" do
    end

    describe "Part Two" do
    end
  end

  describe "Part One" do
    it "is correct" do
      expect(day_mod.part1).to eq 6209190
    end
  end

  describe "Part Two" do
    it "is correct" do
      expect(day_mod.part2).to eq 28545089
    end
  end
end
