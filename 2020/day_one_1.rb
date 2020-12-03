#!/bin/env ruby

data = File.read('day_one_input.txt').split("\n").map(&:to_i).sort
first = 0
last = data.length - 1

while data[first] + data[last] != 2020
  if data[first] + data[last] > 2020
    last -= 1
  else
    first += 1
  end
end

puts "#{data[first]} * #{data[last]} = #{data[first] * data[last]}"
