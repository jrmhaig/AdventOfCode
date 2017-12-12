require 'matrix'

module AdventOfCode
  class DayEleven
    MOVE = {
      'n' => Vector[0, 1],
      's' => Vector[0, -1],
      'nw' => Vector[-0.5, 0.5],
      'sw' => Vector[-0.5, -0.5],
      'ne' => Vector[0.5, 0.5],
      'se' => Vector[0.5, -0.5]
    }

    attr_reader :furthest

    def initialize
      @position = Vector[0, 0]
      @furthest = 0
    end

    def walk *steps
      steps.each do |step|
        @position += MOVE[step]
        @furthest = [distance, @furthest].max
      end
    end

    def distance
      2 * @position[0].abs + [@position[1].abs - @position[0].abs, 0].max
    end
  end
end
