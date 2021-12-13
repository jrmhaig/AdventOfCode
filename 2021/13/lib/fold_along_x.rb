class FoldAlongX
  NAME = 'fold_along_x'

  def initialize(n)
    @n = n
  end

  def call(point)
    point[0] = 2 * @n - point[0] if point[0] >= @n

    point
  end
end
