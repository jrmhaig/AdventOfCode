require 'card'

class CardCollection
  def initialize(*data)
    parsed = data.each_with_object({cards: [], selections: []}) do |line, result|
      (card_input, selection) = line.split(/\s+\|\s+/)
      result[:cards] << Card.new(card_input)
      result[:selections] << selection.split(/\s+/).map(&:to_i)
    end

    @cards = parsed[:cards]
    @cards.each_with_index do |card, i|
      parsed[:selections][i].each do |n|
        card.value(n)
      end

      1.upto(card.value) do |j|
        @cards[i + j].copy(card.copies)
      end if card.value
    end
  end

  def value = @cards.sum { |card| card.value > 0 ? 2**(card.value-1) : 0 }

  def count = @cards.sum(&:copies)
end
