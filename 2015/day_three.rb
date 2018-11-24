$LOAD_PATH << File.expand_path('../lib', __FILE__)
require 'advent_of_code/day_three'

puts AdventOfCode::DayThree.house_count(File.read('day_three_input.txt').chomp)
puts AdventOfCode::DayThree.house_count(File.read('day_three_input.txt').chomp, santas: 2)
