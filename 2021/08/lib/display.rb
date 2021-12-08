class Display
  def initialize(*numbers)
    @numbers = numbers.map(&:to_a).map(&:join)
  end

  def find(n) = @numbers.index(sorted(n))

  private

  def sorted(word) = word.to_s.split(//).sort.join
end
