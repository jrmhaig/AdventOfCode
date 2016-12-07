#!/usr/bin/env ruby

input = File.read('input_day_6.txt').split(/\n/)

counts = [{}, {}, {}, {}, {}, {}, {}, {}]
input.each do |line|
  line.split(//).each_with_index do |c, i|
    counts[i][c] = counts[i][c].to_i + 1
  end
end

counts.each do |list|
  print list.keys.max { |a, b| list[b] <=> list[a] }
end
print "\n"
