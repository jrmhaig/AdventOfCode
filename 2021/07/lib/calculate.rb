class Calculate
  def initialize(data:, calculation:)
    @data = data.sort
    @calculation = calculation
  end

  def fuel_range = @data.min.upto(@data.max).map { |i| fuel(i) }

  def fuel(i)
    @data.tally.each_pair.map do |j, count|
      count * @calculation.call(i, j)
    end.sum
  end
end
