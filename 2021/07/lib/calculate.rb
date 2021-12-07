class Calculate
  def initialize(data:, calculation:)
    @range = (data.min..data.max)
    @data = data.tally
    @calculation = calculation
  end

  def fuel_range = @range.map { |i| fuel(i) }

  def fuel(i) = @data.each_pair.sum { |j, count| count * @calculation.call(i, j) }
end
