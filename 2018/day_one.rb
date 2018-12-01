#!/usr/bin/env ruby

changes = File.read('day_one_input.txt').split(/\n/).map(&:to_i)

t0 = Time.now
counter = 0
steps = changes.map do |i|
  counter += i
end
t1 = Time.now
puts "Part one: #{steps[-1]}"

final = steps[-1]
all_steps = steps.dup

found = nil
i = 1
while found.nil? do
  next_steps = steps.map { |s| s + i * final }
  found = (next_steps & all_steps).first
  all_steps += next_steps
  i += 1
end
t2 = Time.now
puts "Part two: #{found}"

puts "Part one time: #{t1-t0} seconds"
puts "Part two time: #{t2-t1} seconds"
