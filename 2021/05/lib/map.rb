class Map
  def initialize
    @grid = []
  end

  def accept(vent)
    vent.update_map(self)
  end

  def mark(x, y)
    @grid[y] ||= []
    @grid[y][x] ||= 0
    @grid[y][x] += 1
  end

  def count(n)
    fill_grid
    @grid.sum { |row| row.count { |cell| cell >= 2 } }
  end

  def to_s
    fill_grid
    @grid.each do |row|
      puts row.join
    end
  end

  private

  def fill_grid
    max_x = @grid.map { |row| row ? row.length : 0 }.max
    @grid.map! do |row|
      row.to_a.map(&:to_i) + [0]*(row ? max_x - row.length : max_x)
    end
  end
end
