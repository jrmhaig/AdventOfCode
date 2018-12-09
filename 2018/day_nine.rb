#!/usr/bin/env ruby

players = 424

def bump i, list
  ( i + 1 ) % list.length
end

t1 = Time.now

marbles = 71144

circle = [0]
scores = Array.new(players, 0)
current = 0
player = 0
1.upto(marbles).each do |marble|
  if marble % 23 == 0
    scores[player] += marble
    current -= 7
    current %= circle.length
    scores[player] += circle.delete_at(current)
  else
    current = bump current, circle
    circle = circle[0..current] + [marble] + circle[current+1..-1]
    current = bump current, circle
  end
  player = bump player, scores
end

puts "Day one: #{scores.max}"

t2 = Time.now

puts "Part one time: #{t2-t1} seconds"
