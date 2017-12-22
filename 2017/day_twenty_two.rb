$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'advent_of_code/day_twenty_two'

data = File.read('day_twenty_two_input.txt').chomp

grid = AdventOfCode::DayTwentyTwo.new data
10000.times { grid.step }
puts "Part one: #{grid.infection_count}"
