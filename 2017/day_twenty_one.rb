$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'advent_of_code/day_twenty_one'

rules = File.read('day_twenty_one_input.txt').chomp.split(/\n/)

grid = AdventOfCode::DayTwentyOne.new *rules
5.times { grid.step }
puts "Part one: #{grid.pattern.each.sum}"
(18-5).times { |i|
  puts i
  grid.step
}
puts "Part two: #{grid.pattern.each.sum}"
