module Tester
  class Joker
    def initialize(*cards)
      @cards = cards.reject { |card| card == 'J' }
      @jokers = cards.count('J')
    end
  
    def five_of_a_kind? = @cards.uniq.count <= 1
    def four_of_a_kind? = @cards.tally.values.sort == [1, 4 - @jokers]
    def full_house? = @cards.tally.values.sort == [2, 3 - @jokers]
    def three_of_a_kind? = @cards.tally.values.sort == [1, 1, 3 - @jokers]
    def two_pairs? = @cards.tally.values.sort == [1, 2, 2 - @jokers]
    def pair? = @cards.tally.values.sort == [1, 1, 1, 2 - @jokers]
  end
end