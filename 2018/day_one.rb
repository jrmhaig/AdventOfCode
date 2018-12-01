#!/usr/bin/env ruby

changes = File.read('day_one_input.txt').split(/\n/).map(&:to_i)

t0 = Time.now
counter = 0
steps = changes.map do |i|
  counter += i
end
t1 = Time.now
puts "Part one: #{steps[-1]}"

collection = [0]
while collection.count(collection[-1]) <= 1
  i = changes.shift
  collection << collection[-1] + i
  changes << i
end
t2 = Time.now
puts "Part two: #{collection[-1]}"

puts "Part one time: #{t1-t0} seconds"
puts "Part two time: #{t2-t1} seconds"
