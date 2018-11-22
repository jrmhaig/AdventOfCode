$LOAD_PATH << File.expand_path('../lib', __FILE__)
require 'advent_of_code/day_one'

puts AdventOfCode::DayOne.travel(File.read('day_one_input.txt'))
