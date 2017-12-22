require 'matrix'

module AdventOfCode
  class DayTwentyTwo
    attr_reader :position, :direction, :infected, :infection_count

    def initialize start
      @position = Vector[0, 0]
      @direction = Vector[0, 1]
      @infected = []
      @right = Matrix[[0, 1], [-1, 0]]
      @left = Matrix[[0, -1], [1, 0]]
      @infection_count = 0

      rows = start.split(/\n/)
      offset = (rows.count - 1) / 2
      rows.each_with_index do |row, i|
        j = -1
        while (j = row.index('#', j+1))
          @infected << Vector[j - offset, offset - i]
        end
      end
    end

    def step
      if @infected.include? @position
        @direction = @right * @direction
        @infected -= [@position]
      else
        @infection_count += 1
        @direction = @left * @direction
        @infected  << @position
      end
      @position += @direction
    end
  end
end
