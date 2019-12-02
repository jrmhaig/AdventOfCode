class DayOne
  def initialize *masses
    @masses = masses
  end

  def fuel_required
    @masses.map { |mass| (mass / 3.0).floor - 2 }.sum
  end

  def fuel_required_extra
    @masses.map do |mass|
      total = 0
      extra = mass
      while extra > 0
        extra = [(extra / 3.0).floor - 2, 0].max
        total += extra
      end
      total
    end.sum
  end
end
