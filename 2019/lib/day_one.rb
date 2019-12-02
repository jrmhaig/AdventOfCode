class DayOne
  def initialize *masses
    @masses = masses
  end

  def fuel_required
    @masses.map { |mass| (mass / 3.0).floor - 2 }.sum
  end
end
