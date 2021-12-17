class Trench
  attr_reader :x_range, :x_min, :x_max, :y_min, :y_max

  def initialize(x_min, x_max, y_min, y_max)
    @x_min = x_min
    @x_max = x_max
    @y_min = y_min
    @y_max = y_max
  end

  def x_range = (x_min..x_max)

  def x_steps = x_min_steps.upto(x_max)

  def y_steps = y_min.upto(-y_min)

  private

  def x_min_steps = ((-1 + Math.sqrt(1 + 8*@x_min))/2).ceil
end
