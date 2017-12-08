$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'advent_of_code/day_eight'

data = File.read('day_eight_input.txt').split(/\n/)

registers = AdventOfCode::DayEight.new data

puts "Part one: #{registers.largest}"
puts "Part two: #{registers.maximum}"
