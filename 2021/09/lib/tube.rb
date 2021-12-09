class Tube
  attr_accessor :north, :south, :east, :west
  attr_reader :height

  def initialize(height)
    @height = height.to_i
  end

  def minimum?
    !(
      (@north && @height >= @north.height) ||
      (@south && @height >= @south.height) ||
      (@east && @height >= @east.height) ||
      (@west && @height >= @west.height)
    )
  end

  def risk = @height + 1
end
