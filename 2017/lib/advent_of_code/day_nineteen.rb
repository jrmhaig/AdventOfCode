require 'matrix'

module AdventOfCode
  class DayNineteen
    def initialize maze
      @maze = maze.split(/\n/).map { |line| line.chomp.split // }
    end

    def trace
      # Find the start
      # Note, rows (y) = first number, columns (x) = second number
      # Positive is down and right
      pointer = Vector[0, @maze[0].index('|')]
      direction = Vector[1, 0]
      message = ''
      while in_maze(pointer)
        message += @maze[pointer[0]][pointer[1]] if /[A-Z]/.match(@maze[pointer[0]][pointer[1]])
        if @maze[pointer[0]][pointer[1]] == '+'
          if direction[0] == 0
            if /[A-Z|]/.match(@maze[pointer[0] - 1][pointer[1]])
              direction = Vector[-1, 0]
            else
              direction = Vector[1, 0]
            end
          else
            if /[A-Z-]/.match(@maze[pointer[0]][pointer[1] - 1])
              direction = Vector[0, -1]
            else
              direction = Vector[0, 1]
            end
          end
        end
        #local_map pointer, direction
        pointer += direction
      end
      message
    end

    def in_maze pointer
      @maze[pointer[0]][pointer[1]] != ' ' &&
        pointer[0] >= 0 &&
        pointer[1] >= 0 &&
        pointer[0] < @maze.size &&
        pointer[1] < @maze.map(&:size).max
    end

    def local_map pointer, direction
      puts "==========="
      (pointer[0] - 3).upto (pointer[0] + 3) do |i|
        (pointer[1] - 3).upto (pointer[1] + 3) do |j|
          print (in_maze([i, j]) ? @maze[i][j] : '.')
        end
        print "\n"
      end
      puts "-----------"
      p direction
      puts "==========="
    end
  end
end
