class Universe
  attr_reader :galaxies
  attr_writer :age

  def initialize(width, height)
    @empty_cols = (0..width - 1).to_a
    @empty_rows = (0..height - 1).to_a
    @galaxies = []
    @age = 1
  end

  def add_galaxy(x, y)
    @empty_cols.delete(x)
    @empty_rows.delete(y)
    @galaxies << [x, y]
  end

  def distance(a, b)
    return false unless @galaxies.include?(a) && @galaxies.include?(b)

    double_cols = range(a[0], b[0]) & @empty_cols
    double_rows = range(a[1], b[1]) & @empty_rows
    (b[0] - a[0]).abs + (b[1] - a[1]).abs + (double_cols.length + double_rows.length)*@age
  end

  private
  def range(i, j) = (i < j ? (i+1..j) : (j+1..i)).to_a
end
