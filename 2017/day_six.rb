$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'advent_of_code/day_six'

data = File.read('day_six_input.txt').chomp.split(/\s+/).map(&:to_i)

#puts "Part one: #{AdventOfCode::DaySix.loop_count(data)}"
puts "Part two: #{AdventOfCode::DaySix.loop_size(data)}"
