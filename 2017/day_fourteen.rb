$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'advent_of_code/day_fourteen'

input = 'wenycdww'

code = AdventOfCode::DayFourteen.new input
puts "Part one: #{code.used}"
puts "Part two: #{code.number_of_groups}"
