module AdventOfCode
  class DayTwentyTwo
    attr_reader :position, :direction, :infection_count,
                :weakened, :infected, :flagged
    attr_writer :evolved

    RIGHT = {
      [0, 1] => [1, 0],
      [1, 0] => [0, -1],
      [0, -1] => [-1, 0],
      [-1, 0] => [0, 1]
    }
    LEFT = {
      [0, 1] => [-1, 0],
      [-1, 0] => [0, -1],
      [0, -1] => [1, 0],
      [1, 0] => [0, 1]
    }
    REVERSE = {
      [0, 1] => [0, -1],
      [1, 0] => [-1, 0],
      [0, -1] => [0, 1],
      [-1, 0] => [1, 0]
    }

    def initialize start
      @position = [0, 0]
      @direction = [0, 1]
      @weakened = []
      @infected = []
      @flagged = []
      @bits = {}
      @infection_count = 0
      @evolved = false

      rows = start.split(/\n/)
      offset = (rows.count - 1) / 2
      rows.each_with_index do |row, i|
        j = -1
        while (j = row.index('#', j+1))
          @infected << [j - offset, offset - i]
          set_bit(j - offset, offset - i, :infected)
        end
      end
    end

    def step
      if get_bit(*@position) == :flagged
        @direction = REVERSE[@direction]
        set_bit *@position, nil
      elsif get_bit(*@position) == :infected
        @direction = RIGHT[@direction]
        set_bit *@position, (@evolved ? :flagged : nil)
      elsif get_bit(*@position) == :weakened
        set_bit *@position, :infected
        @infection_count += 1
      else
        @direction = LEFT[@direction]
        set_bit *@position, (@evolved ? :weakened : :infected)
        @infection_count += 1 unless @evolved
      end
      @position = [
        @position[0] + @direction[0],
        @position[1] + @direction[1]
      ]
    end

    def get_bit x, y
      return nil if @bits[x].nil?
      @bits[x][y]
    end

    private

    def set_bit x, y, value = nil
      @bits[x] = {} if @bits[x].nil?
      @bits[x][y] = value
    end
  end
end
