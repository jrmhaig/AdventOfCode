#!/usr/bin/env ruby
require 'matrix'

class Point
  attr_reader :pos

  def initialize x, y, xdiff, ydiff
    @pos = Vector[x, y]
    @vel = Vector[xdiff, ydiff]
  end

  def x
    @pos[0]
  end

  def y
    @pos[1]
  end

  def move
    @pos += @vel
  end

  def == other
    @pos == other.pos
  end
end

def plot points
  xs = points.map(&:x)
  ys = points.map(&:y)

  ys.min.upto(ys.max) do |y|
    xs.min.upto(xs.max) do |x|
      print points.include?(Point.new(x, y, 0, 0)) ? '#' : '.'
    end
    puts
  end
end

def find points
  ys = points.map(&:y)
  last_y = ys.max - ys.min

  i = 0
  while true
    points.each(&:move)
    ys = points.map(&:y)
    y = ys.max - ys.min
    return i if y > last_y
    last_y = y
    i += 1
  end
end

def get_points
  File.read('day_ten_input.txt').split(/\n/).map do |line|
    Point.new *line.match(/position=<\s*(-?\d+),\s*(-?\d+)> velocity=<\s*(-?\d+),\s*(-?\d+)>/).captures.map(&:to_i)
  end
end

t1 = Time.now
i = find get_points
points = get_points
i.times { points.each(&:move) }
puts 'Part one:'
plot points
puts "Part two: #{i} seconds"
t2 = Time.now

puts "Part one and two time: #{t2-t1} seconds"
