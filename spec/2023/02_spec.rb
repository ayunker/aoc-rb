require "./lib/2023/02"

RSpec.describe "Day 2: Title" do
  let(:day_mod) { Object.const_get(:Day02) }

  context "test input" do
    describe "Part One" do
    end

    describe "Part Two" do
    end
  end

  describe "Part One" do
    it "is correct" do
      expect(day_mod.part1).to eq 2006
    end
  end

  describe "Part Two" do
    it "is correct" do
      expect(day_mod.part2).to eq 84911
    end
  end
end
