class Probe
  attr_reader :x, :y

  def initialize(x, y, trench:)
    @x = x
    @y = y
    @trench = trench
  end

  def y_max = @y * (@y + 1) / 2

  def on_target?
    y_min_steps <= y_max_steps && (@trench.x_range.include?(x_at(y_min_steps)) || @trench.x_range.include?(x_at(y_max_steps)))
  end

  private

  def y_min_steps = (((2 * @y + 1) + Math.sqrt((2 * @y + 1)**2 - 8 * @trench.y_max))/2).ceil

  def y_max_steps = (((2 * @y + 1) + Math.sqrt((2 * @y + 1)**2 - 8 * @trench.y_min))/2).floor

  def x_at(n) = n > @x ? (@x * (@x + 1)/2) : n * @x - n * (n-1) / 2
end
