class Platform
  attr_reader :grid

  DIRECTIONS = {
    north: [-1, 0],
    east: [0, -1],
    south: [1, 0],
    west: [0, 1]
  }

  def initialize(*rows)
    @grid = rows.map { |row| row.split(//) }
    @width = @grid.first.count
    @height = @grid.count
  end

  def weight = @grid.each_with_index.sum { |row, i| (@height - i)*row.count('O') }

  def signature = @grid.map(&:join).join

  def cycle
    north
    west
    south
    east
  end

  def north
    1.upto(@grid.count-1) do |i|
      @grid[i].count.times do |j|
        if @grid[i][j] == 'O'
          i.downto(1) do |k|
            if @grid[k-1][j] == '.'
              @grid[k-1][j] = 'O'
              @grid[k][j] = '.'
            else
              break
            end
          end
        end
      end
    end
  end

  def south
    (@grid.count-2).downto(0) do |i|
      @grid[i].count.times do |j|
        if @grid[i][j] == 'O'
          i.upto(@grid.count-2) do |k|
            if @grid[k+1][j] == '.'
              @grid[k+1][j] = 'O'
              @grid[k][j] = '.'
            else
              break
            end
          end
        end
      end
    end
  end

  def east
    (@grid.first.count-2).downto(0) do |j|
      @grid.count.times do |i|
        if @grid[i][j] == 'O'
          j.upto(@grid.first.count-2) do |k|
            if @grid[i][k+1] == '.'
              @grid[i][k+1] = 'O'
              @grid[i][k] = '.'
            else
              break
            end
          end
        end
      end
    end
  end

  def west
    1.upto(@grid.first.count-1) do |j|
      @grid.count.times do |i|
        if @grid[i][j] == 'O'
          j.downto(1) do |k|
            if @grid[i][k-1] == '.'
              @grid[i][k-1] = 'O'
              @grid[i][k] = '.'
            else
              break
            end
          end
        end
      end
    end
  end
end
