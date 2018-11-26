$LOAD_PATH << File.expand_path('../lib', __FILE__)
require 'advent_of_code/day_five'

puts (File.read('day_five_input.txt').split(/\n/).select do |pattern|
  AdventOfCode::DayFive.is_nice? pattern
end).count
puts (File.read('day_five_input.txt').split(/\n/).select do |pattern|
  AdventOfCode::DayFive.is_really_nice? pattern
end).count
