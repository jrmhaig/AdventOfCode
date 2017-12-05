$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'advent_of_code/day_five'

data = File.read('day_five_input.txt').split(/\n/).map(&:to_i)

puts "Part one: #{AdventOfCode::DayFive.jump(*data)}"
