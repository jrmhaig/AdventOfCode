$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'advent_of_code/day_eleven'

data = File.read('day_eleven_input.txt').chomp.split(/,/)

metric = AdventOfCode::DayEleven.new
metric.walk *data

puts "Part one: #{metric.distance}"
