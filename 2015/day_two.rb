$LOAD_PATH << File.expand_path('../lib', __FILE__)
require 'advent_of_code/day_two'

puts AdventOfCode::DayTwo.all_presents(*File.read('day_two_input.txt').split)
puts AdventOfCode::DayTwo.all_ribbons(*File.read('day_two_input.txt').split)
