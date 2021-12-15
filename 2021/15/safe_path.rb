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

current = points.first
current.distance = 0
finish = points.last
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

last_row = []
visited = []
points = []
5.times do |n|
  data.each_with_index do |line, j|
    last_point = nil
    row = []
    5.times do |m|
      subrow = line.split(//).each_with_index.map do |risk, i|
        new_risk = 1 + ((risk.to_i + m + n - 1) % 9)
        Point.new(
          new_risk,
          line.length*m + i,
          data.length*n + j
        ).tap do |point|
          point.add_neighbour(last_point)
          last_point&.add_neighbour(point)

          point.add_neighbour(last_row[line.length*m + i])
          last_row[line.length*m + i]&.add_neighbour(point)

          last_point = point
        end
      end
      row += subrow
    end
    last_row = row
    points += row
  end
end

current = points.first
current.distance = 0
finish = points.last
candidates = []
i = 0
n = points.count
while !visited.include?(finish)
  print "\r#{current.x}, #{current.y} [#{candidates.count}/#{n - visited.count}]    " if i % 50 == 0
  i += 1
  (current.neighbours - visited).each do |point|
    dist = current.distance + point.risk
    point.distance = [point.distance, dist].min


    candidates = candidates.select { |candidate| candidate.distance < point.distance} + [point]  + candidates.select { |candidate| candidate.distance >= point.distance }

    #candidates << point unless candidates.include?(point)
  end
  visited << current
  candidates.delete(current)
  #current = (points - visited).sort { |a, b| a.distance <=> b.distance }.first
  #current = candidates.sort { |a, b| a.distance <=> b.distance }.first
  current = candidates.shift
end

puts "\r2) #{points.last.distance}       "
