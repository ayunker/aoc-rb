require "pry"

module Day07
  CARD_STRENGTH = ["2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K", "A"]
  CARD_STRENGTH_2 = ["J", "2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K", "A"]

  HAND_TYPE = {
    five_oak: 7,
    four_oak: 6,
    full_house: 5,
    three_oak: 4,
    two_pair: 3,
    pair: 2,
    high_card: 1
  }

  module_function

  def input
    File.readlines("./input/2023/07.txt", chomp: true)
  end

  def test_input
    File.readlines("./input/2023/07-test.txt", chomp: true)
  end

  def parsed_input(test = false)
    test ? test_input : input
  end

  def part1(test = false)
    hands = parsed_input(test).map do |x|
      raw_hand, bid = x.split(/\s+/)
      unsorted_hand = raw_hand.chars.map { |x| CARD_STRENGTH.index(x) }
      hand = sort_hand(raw_hand)
      hand_type = hand_type(hand)
      {
        hand:,
        hand_type:,
        bid: bid.to_i,
        unsorted_hand:
      }
    end
    calc_winnings(hands)
  end

  def part2(test = false)
    hands = parsed_input(test).map do |x|
      raw_hand, bid = x.split(/\s+/)
      unsorted_hand = raw_hand.chars.map { |x| CARD_STRENGTH_2.index(x) }
      hand_type, hand = strongkest_hand(raw_hand)
      {
        hand:,
        hand_type:,
        bid: bid.to_i,
        unsorted_hand:
      }
    end
    calc_winnings(hands)
  end

  def calc_winnings(hands)
    hands.sort_by do |x|
      [HAND_TYPE[x[:hand_type]], *x[:unsorted_hand]]
    end
      .map.with_index { |x, i| [x[:bid], i + 1].reduce(:*) }
      .reduce(:+)
  end

  def sort_hand(hand)
    hand.chars.sort_by { |x| card_strength_sort[x] }
  end

  def strongkest_hand(hand)
    # there can be more than 1 joker :(
    # we need to identify if a joker, and if there is then iterate the possibilities
    # sort the hand, and calc hand type. and find the highest value
    # MAYBE don't iterate all possibilites of J, just those in the hand
    return [hand_type(sort_hand(hand)), sort_hand(hand)] unless hand.include?("J")
    return [:five_oak, sort_hand("AAAAA")] if hand == "JJJJJ"

    cards_in_hand = hand.chars.uniq - ["J"]
    cards_in_hand.map do |x|
      sorted = sort_hand(hand.gsub("J", x))
      [hand_type(sorted), sorted]
    end.max_by do |x|
      HAND_TYPE[x.first]
    end
  end

  def hand_type(hand)
    case hand
    in [a, ^a, ^a, ^a, ^a]
      :five_oak
    in [a, ^a, ^a, ^a, b]
      :four_oak
    in [b, a, ^a, ^a, ^a]
      :four_oak
    in [a, ^a, ^a, b, ^b]
      :full_house
    in [b, ^b, a, ^a, ^a]
      :full_house
    in [a, ^a, ^a, b, c]
      :three_oak
    in [b, c, a, ^a, ^a]
      :three_oak
    in [b, a, ^a, ^a, c]
      :three_oak
    in [a, ^a, b, ^b, c]
      :two_pair
    in [a, ^a, c, b, ^b]
      :two_pair
    in [c, a, ^a, b, ^b]
      :two_pair
    in [a, ^a, b, c, d]
      :pair
    in [b, a, ^a, c, d]
      :pair
    in [b, c, a, ^a, d]
      :pair
    in [b, c, d, a, ^a]
      :pair
    else
      :high_card
    end
  end

  def card_strength_sort
    @card_stringth_sort ||= begin
      h = {}
      CARD_STRENGTH.each_with_index do |x, i|
        h[x] = i + 1
      end
      h
    end
  end
end
