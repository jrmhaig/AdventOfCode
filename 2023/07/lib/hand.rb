class Hand
  include Comparable

  attr_reader :cards

  HANDS = [
    :high,
    :pair,
    :two_pairs,
    :three_of_a_kind,
    :full_house,
    :four_of_a_kind,
    :five_of_a_kind
  ]

  def initialize(cards, card_ranking:, tester:)
    @cards = cards.split(//)
    @card_ranking = card_ranking
    @tester = tester.new(*@cards)
  end

  def type
    return :five_of_a_kind if @tester.five_of_a_kind?
    return :four_of_a_kind if @tester.four_of_a_kind?
    return :full_house if @tester.full_house?
    return :three_of_a_kind if @tester.three_of_a_kind?
    return :two_pairs if @tester.two_pairs?
    return :pair if @tester.pair?
    :high
  end

  def <=>(other)
    return HANDS.index(type) <=> HANDS.index(other.type) if type != other.type

    card_ranks.zip(other.card_ranks).map { |a, b| a <=> b }.reject(&:zero?).first.to_i
  end

  def card_ranks = @cards.map { |card| @card_ranking.index(card) }
end
