$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'advent_of_code/day_nineteen'

data = File.read('day_nineteen_input.txt')

maze = AdventOfCode::DayNineteen.new data
puts "Part one: #{maze.trace}"
puts "Part two: #{maze.step_count}"
