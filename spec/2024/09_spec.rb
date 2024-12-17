require "./lib/2024/09"

RubyVM::InstructionSequence.compile_option = {
  tailcall_optimization: true,
  trace_instruction: false
}

RSpec.describe "Day 9: Title" do
  let(:day_mod) { Object.const_get(:Day09) }

  context "test input" do
    describe "Part One" do
      it do
        expect(day_mod.part1(true)).to eq 1928
        expect(day_mod.part1_alt).to eq 1928
      end

      it do
        expect(day_mod.part2(true)).to eq 2858
      end
    end
  end

  describe "Part One" do
    it do
      expect(day_mod.part1).to eq 6446899523367
    end
  end

  describe "Part Two" do
    it do
      expect(day_mod.part2).to eq false
    end
  end
end
