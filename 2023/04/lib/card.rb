class Card
  attr_reader :copies

  def initialize(data)
    (@card, @numbers) = data.split(/:\s*/)
    @card = @card.gsub(/Card /, '').to_i
    @numbers = @numbers.split(/\s+/).map!(&:to_i)
    @value = 0
    @copies = 1
  end

  def value(number = nil)
    return @value unless number && @numbers.include?(number)

    @value = @value += 1
  end

  def copy(n) = @copies += n
end
