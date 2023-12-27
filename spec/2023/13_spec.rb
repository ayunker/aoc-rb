require "./lib/2023/13"

RSpec.describe "Day 13: Title" do
  let(:day_mod) { Object.const_get(:Day13) }

  context "test input" do
    describe "Part One" do
      it do
        expect(day_mod.part1(true)).to eq 405
      end

      xit do
        expect(day_mod.part2(true)).to eq false
      end
    end
  end

  describe "equal_at_partition?" do
    it do
      expect(day_mod.equal_at_partition?("#.##..##.", 0)).to eq false
      expect(day_mod.equal_at_partition?("#.##..##.", 3)).to eq false
      expect(day_mod.equal_at_partition?("#.##..##.", 5)).to eq false
      expect(day_mod.equal_at_partition?("#.##..##.", 4)).to eq true

      expect(day_mod.equal_at_partition?("..#.##.#.", 0)).to eq true
      expect(day_mod.equal_at_partition?("..#.##.#.", 3)).to eq false
      expect(day_mod.equal_at_partition?("..#.##.#.", 5)).to eq false
      expect(day_mod.equal_at_partition?("..#.##.#.", 4)).to eq true
    end
  end

  describe "Part One" do
    it do
      expect(day_mod.part1).to eq 34772
    end
  end

  xdescribe "Part Two" do
    it do
      expect(day_mod.part2).to eq false
    end
  end
end
