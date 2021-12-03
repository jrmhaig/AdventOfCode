class SubState
  attr_accessor :report

  def initialize
    @report = []
  end

  def accept(visitor)
    visitor.update_state(self)
  end

  def power_consumption = gamma * epsilon

  private

  def gamma = @report.map { |n| n.positive? ? '1' : '0' }.join.to_i(2)

  def epsilon = @report.map { |n| n.positive? ? '0' : '1' }.join.to_i(2)
end
