require "./lib/2023/03"

RSpec.describe "Day 3: Title" do
  let(:day_mod) { Object.const_get(:Day03) }

  context "test input" do
    describe "Part One" do
    end

    describe "Part Two" do
    end
  end

  describe "Part One" do
    it "is correct" do
      expect(day_mod.part1).to eq 525119
    end
  end

  describe "Part Two" do
    it "is correct" do
      expect(day_mod.part2).to eq 76504829
    end
  end
end
