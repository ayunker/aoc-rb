require "./lib/2023/07"

RSpec.describe "Day 7: Title" do
  let(:day_mod) { Object.const_get(:Day07) }

  describe ".hand_type" do
    it "returns five oak" do
      expect(day_mod.hand_type(["A", "A", "A", "A", "A"])).to eq :five_oak
    end

    it "returns four oak" do
      expect(day_mod.hand_type(["A", "A", "A", "A", "4"])).to eq :four_oak
      expect(day_mod.hand_type(["3", "A", "A", "A", "A"])).to eq :four_oak
    end

    it "returns three oak" do
      expect(day_mod.hand_type(["A", "A", "A", "3", "4"])).to eq :three_oak
      expect(day_mod.hand_type(["3", "2", "A", "A", "A"])).to eq :three_oak
      expect(day_mod.hand_type(["3", "A", "A", "A", "7"])).to eq :three_oak
    end

    it "returns full house" do
      expect(day_mod.hand_type(["A", "A", "A", "3", "3"])).to eq :full_house
      expect(day_mod.hand_type(["A", "A", "3", "3", "3"])).to eq :full_house
    end

    it "returns two pair" do
      expect(day_mod.hand_type(["A", "A", "8", "3", "3"])).to eq :two_pair
      expect(day_mod.hand_type(["A", "A", "3", "3", "9"])).to eq :two_pair
      expect(day_mod.hand_type(["J", "A", "A", "3", "3"])).to eq :two_pair
    end

    it "returns  pair" do
      expect(day_mod.hand_type(["A", "A", "8", "3", "6"])).to eq :pair
      expect(day_mod.hand_type(["J", "A", "A", "3", "2"])).to eq :pair
      expect(day_mod.hand_type(["A", "Q", "3", "3", "9"])).to eq :pair
      expect(day_mod.hand_type(["A", "Q", "3", "9", "9"])).to eq :pair
    end

    it "returns high card" do
      expect(day_mod.hand_type(["A", "K", "8", "3", "6"])).to eq :high_card
    end
  end

  describe ".strongkest_hand" do
    it do
      expect(day_mod.strongkest_hand("32T3K")).to eq [:pair, ["2", "3", "3", "T", "K"]]
      expect(day_mod.strongkest_hand("QQQJA")).to eq [:four_oak, ["Q", "Q", "Q", "Q", "A"]]
      expect(day_mod.strongkest_hand("KTJJT")).to eq [:four_oak, ["T", "T", "T", "T", "K"]]
      expect(day_mod.strongkest_hand("JJJJJ")).to eq [:five_oak, ["A", "A", "A", "A", "A"]]
    end
  end

  context "test input" do
    describe "Part One" do
      it do
        expect(day_mod.part1(true)).to eq 6440
      end

      it do
        expect(day_mod.part2(true)).to eq 5905
      end
    end
  end

  describe "Part One" do
    it "is correct" do
      expect(day_mod.part1).to eq 248559379
    end
  end

  describe "Part Two" do
    it "is correct" do
      expect(day_mod.part2).to eq 249631254
    end
  end
end
