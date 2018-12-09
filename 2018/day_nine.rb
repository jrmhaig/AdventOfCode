#!/usr/bin/env ruby

def play players, marbles
  circle = [0]
  scores = Array.new(players, 0)
  player = 0
  1.upto(marbles).each do |marble|
    if marble % 23 == 0
      scores[player] += marble
      scores[player] += circle.delete_at(-8)
      circle = circle[-6..-1] + circle[0..-7]
    else
      circle << circle.shift
      circle << marble
    end
    player = ( player + 1 ) % scores.length
  end
  scores.max
end

t1 = Time.now

puts "Day one: #{play(424, 71144)}"

t2 = Time.now

puts "Part one time: #{t2-t1} seconds"
