$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'advent_of_code/day_fifteen'

a = 783
b = 325

generators = AdventOfCode::DayFifteen.new a, b
puts "Part one: #{generators.count 40_000_000}"

