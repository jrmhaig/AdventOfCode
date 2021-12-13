class FoldAlongY
  NAME = 'fold_along_y'

  def initialize(n)
    @n = n
  end

  def call(point)
    point[1] = 2 * @n - point[1] if point[1] >= @n

    point
  end
end
