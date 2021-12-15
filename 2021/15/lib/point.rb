class Point
  attr_accessor :risk, :distance, :neighbours, :x, :y

  def initialize(risk, x, y)
    @risk = risk
    @x = x
    @y = y
    @visited = false
    @distance = Float::INFINITY
    @neighbours = []
  end

  def add_neighbour(other)
    @neighbours << other if other
  end
end
