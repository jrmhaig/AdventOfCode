#!/usr/bin/env ruby

class Maze
  attr_reader :direction, :width, :height

  def initialize(input)
    @maze = input.map { |line| line.split('') }
    @width = @maze[0].length
    @height = @maze.length

    # Find the location of the '^' character
    @location = @maze.each_with_index.find { |row, y| row.include?('^') }
    @location[0] = @location[0].index('^')
    @maze[@location[1]][@location[0]] = '.'
    @direction = :up
    @visited_points = [@location]
  end

  def visited = @visited_points.uniq.length

  def travel
    case @direction
    when :up
      move(0, -1, :right)
    when :down
      move(0, 1, :left)
    when :left
      move(-1, 0, :up)
    when :right
      move(1, 0, :down)
    end
  end

  def loop_potent(x1, y1, x2, y2)
    return false if x1 == 0 || y1 == 0 || x2 == @width - 1 || y2 == @height - 1

    [@maze[y1-1][x1], @maze[y1][x2+1], @maze[y2+1][x2], @maze[y2][x1-1]].count('#') == 3
  end

  def [](y) = @maze[y]

  def blocked_column(x, y1, y2) = (y1..y2).any? { |y| @maze[y][x] == '#' }

  private

  def move(dx, dy, new_direction)
    x, y = @location
    loop do
      x += dx
      y += dy

      if y < 0 || y >= @height || x < 0 || x >= @width
        @direction = :escaped
        break
      elsif @maze[y][x] == '#'
        @location = [x - dx, y - dy]
        @direction = new_direction
        break
      else
        @visited_points << [x, y]
      end
    end
  end
end

# Read in the input file
input = File.read('input.txt').split("\n")

maze = Maze.new(input)

while maze.direction != :escaped
  maze.travel
end

puts "Part 1: #{maze.visited}"

count = 0

puts "trying (2, 1) to (8, 6)"
puts maze.blocked_column(2, 1, 6)
puts maze.blocked_column(8, 1, 6)
puts maze.loop_potent(2, 1, 8, 6)

maze.height.times do |y1|
  (y1+1).upto(maze.height - 1) do |y2|
    x1 = 0
    while x1 < maze.width
      puts "trying (#{x1}, #{y1}) to (#{x1}, #{y2})"
      if !maze.blocked_column(x1, y1, y2)
        puts "I'm here"
        x2 = x1 + 1
        while x2 < maze.width
          if maze[y1][x2] == '#' || maze[y2][x2] == '#'
            x1 = x2 + 1
            x2 = x1 + 1
          elsif maze.blocked_column(x2, y1, y2)
            x2 += 1
          else
            if maze.loop_potent(x1, y1, x2, y2)
              puts "Loop found at (#{x1}, #{y1}) and (#{x2}, #{y2})"
              count +=1 
            end
            x2 += 1
          end
        end
      end
      x1 += 1
    end
  end
end
puts "Part 2: #{count}"
