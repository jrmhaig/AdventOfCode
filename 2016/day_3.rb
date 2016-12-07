#!/usr/bin/env ruby

input = File.read('input_day_3.txt')

good = 0
bad = 0
input.split(/\n/).each do |line|
  a, b, c = line.gsub(/^\s+/,'').split(/\s+/).map{|n| n.to_i}.sort
  puts "#{c}, #{b}, #{a}"
  if c < a + b
    good = good + 1
    puts "  Good"
  else
    bad = bad + 1
    puts "  Bad"
  end
end
puts "Good: #{good}"
puts "Bad: #{bad}"
