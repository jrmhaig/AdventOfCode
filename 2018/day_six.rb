#!/usr/bin/env ruby

destinations = File.read('day_six_input.txt')
  .split(/\n/)
  .map { |d| d.split(/,/).map(&:to_i) }

t1 = Time.now

left = destinations.map(&:first).min
right = destinations.map(&:first).max
top = destinations.map(&:last).min
bottom = destinations.map(&:last).max

areas = Array.new(destinations.size, 0)

def distance_between a, b
  (a[0] - b[0]).abs + (a[1] - b[1]).abs
end

left.upto(right) do |i|
  top.upto(bottom) do |j|
    distances = destinations.map { |d| distance_between(d, [i, j]) }
    min = distances.min
    next if distances.count(min) > 1
    k = distances.index(min)
    next if areas[k] == -1
    if [left, right].include?(i) || [top, bottom].include?(j)
      areas[k] = -1
    else
      areas[k] += 1
    end
  end
end

puts "Part one: #{areas.max}"
t2 = Time.now

size = 0

left.upto(right) do |i|
  top.upto(bottom) do |j|
    size+=1 if destinations.map { |d| distance_between(d, [i, j]) }.sum < 10000
  end
end

puts "Part two: #{size}"
t3 = Time.now

puts "Part one time: #{t2 - t1} seconds"
puts "Part two time: #{t3 - t2} seconds"
