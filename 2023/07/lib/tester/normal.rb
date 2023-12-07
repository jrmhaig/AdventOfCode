module Tester
  class Normal
    def initialize(*cards)
      @cards = cards
    end

    def five_of_a_kind? = @cards.uniq.length == 1
    def four_of_a_kind? = @cards.tally.values.sort == [1, 4]
    def full_house? = @cards.tally.values.sort == [2, 3]
    def three_of_a_kind? = @cards.tally.values.sort == [1, 1, 3]
    def two_pairs? = @cards.tally.values.sort == [1, 2, 2]
    def pair? = @cards.tally.values.sort == [1, 1, 1, 2]
  end
end