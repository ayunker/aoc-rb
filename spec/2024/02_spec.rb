require "./lib/2024/02"

RSpec.describe "Day 2: Title" do
  let(:day_mod) { Object.const_get(:Day02) }

  context "test input" do
    describe "Part One" do
    end

    describe "Part Two" do
    end
  end

  context "test input" do
    describe "Part One" do
      it do
        expect(day_mod.part1(true)).to eq 2
      end

      it do
        expect(day_mod.part2(true)).to eq 4
      end
    end
  end

  describe "Part One" do
    it do
      expect(day_mod.part1).to eq 490
    end
  end

  describe "Part Two" do
    it do
      expect(day_mod.part2).to eq 536
    end
  end
end
