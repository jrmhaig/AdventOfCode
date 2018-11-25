$LOAD_PATH << File.expand_path('../lib', __FILE__)
require 'advent_of_code/day_four'

puts AdventOfCode::DayFour.find_coin('iwrupvqb')
puts AdventOfCode::DayFour.find_coin('iwrupvqb', 6)
