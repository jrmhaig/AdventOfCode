#!/usr/bin/env ruby

input = File.read('input_day_3.txt')

good = 0
bad = 0

lines = input.split(/\n/)
while lines.count > 0
  trg = [[], [], []]
#  puts lines[0, 3]
  3.times do |i|
    trg[i] = lines.shift.gsub(/^\s+/,'').split(/\s+/).map{|n| n.to_i}
  end
#puts trg

  3.times do |i|
    a,b,c = [trg[0][i], trg[1][i], trg[2][i]].sort
    if c < a + b
      good = good + 1
    else
      bad = bad + 1
    end
  end
end
puts "Good: #{good}"
puts "Bad: #{bad}"
