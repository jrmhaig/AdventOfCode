#!/usr/bin/env ruby

$LOAD_PATH << File.expand_path('lib', __dir__)

require 'point'

data = File.open('input.txt').readlines.map(&:chomp)

last_row = []
visited = []
points = []
data.each_with_index do |line, j|
  last_point = nil
  row = line.split(//).each_with_index.map do |risk, i|
    Point.new(risk.to_i, i, j).tap do |point|
      point.add_neighbour(last_point)
      last_point&.add_neighbour(point)

      point.add_neighbour(last_row[i])
      last_row[i]&.add_neighbour(point)

      last_point = point
    end
  end
  points += row
  last_row = row
end

start = points.first
start.distance = 0
finish = points.last

current = start
i = 0
n = points.count
while !visited.include?(finish)
  print "\r#{current.x}, #{current.y} [#{n - visited.count}]" if i % 50 == 0
  i += 1
  (current.neighbours - visited).each do |point|
    dist = current.distance + point.risk
    point.distance = [point.distance, dist].min
  end
  visited << current
  current = (points - visited).sort { |a, b| a.distance <=> b.distance }.first
end

puts "\r1) #{points.last.distance}       "
