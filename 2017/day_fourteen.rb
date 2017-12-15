$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'advent_of_code/day_fourteen'

input = 'wenycdww'

puts "Part one: #{AdventOfCode::DayFourteen.used(input)}"
