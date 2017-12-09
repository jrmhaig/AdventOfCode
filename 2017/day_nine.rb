$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'advent_of_code/day_nine'

data = File.read('day_nine_input.txt')

puts "Part one: #{AdventOfCode::DayNine.score(data)}"

