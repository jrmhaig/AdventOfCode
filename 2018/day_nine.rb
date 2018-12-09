#!/usr/bin/env ruby

def play players, marbles
  circle = [
    11, 1, 12, 6, 13, 3, 14, 7, 15,
    0, 16, 8, 17, 4, 18, 9, 19, 2, 20, 10, 21, 5, 22
  ]

  scores = Array.new(players, 0)
  player = 0
  23.upto(marbles).each do |marble|
    if marble % 23 == 0
      scores[marble % players] += marble + circle.delete_at(-8)
      circle = circle[-6..-1] + circle[0..-7]
    else
      circle << circle.shift
      circle << marble
    end
  end
  scores.max
end

t1 = Time.now

puts "Day one: #{play(424, 71144)}"

t2 = Time.now

#puts "Day two: #{play(424, 711440)}"

t3 = Time.now

puts "Part one time: #{t2-t1} seconds"
puts "Part two time: #{t3-t2} seconds"
