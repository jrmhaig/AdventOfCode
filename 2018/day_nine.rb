#!/usr/bin/env ruby

def play players, marbles
  scores = Array.new(players, 0)

  circle = [0]

  1.upto(45).each do |marble|
    if marble % 23 == 0
      scores[marble % players] += marble + circle.delete_at(-8)
      circle = circle[-6..-1] + circle[0..-7]
    else
      circle << circle.shift
      circle << marble
    end
  end

  marble = 46
  2.upto(marbles/23).each do |i|
    scores[marble % players] += marble + circle.delete_at(-8)
    circle = circle[-6..-1] + circle[0..-7]
    circle = circle[22..-1] + circle[0,22].zip((i*23 + 1)..((i+1)*23 - 1)).flatten
    marble += 23
  end

  scores.max
end

t1 = Time.now

#puts "1: #{play(9, 25)}"
#puts "2: #{play(10, 1618)}"
#puts "3: #{play(13, 7999)}"
#puts "4: #{play(17, 1104)}"
#puts "5: #{play(21, 6111)}"
#puts "6: #{play(30, 5807)}"
puts "Day one: #{play(424, 71144)}"

t2 = Time.now

#puts "Day two: #{play(424, 7114400)}"

#t3 = Time.now

puts "Part one time: #{t2-t1} seconds"
#puts "Part two time: #{t3-t2} seconds"
