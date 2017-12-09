$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'advent_of_code/day_nine'

data = File.read('day_nine_input.txt')

stream = AdventOfCode::DayNine.new(data)
puts "Part one: #{stream.score}"
puts "Part two: #{stream.garbage_count}"
