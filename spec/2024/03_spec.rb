require "./lib/2024/03"

RSpec.describe "Day 3: Title" do
  let(:day_mod) { Object.const_get(:Day03) }

  context "test input" do
    describe "Part One" do
      it do
        expect(day_mod.part1(true)).to eq 161
      end

      it do
        expect(day_mod.part2(true)).to eq 48
      end
    end
  end

  describe "Part One" do
    it do
      expect(day_mod.part1).to eq 157621318
    end
  end

  describe "Part Two" do
    it do
      expect(day_mod.part2).to eq 79845780
    end
  end
end
