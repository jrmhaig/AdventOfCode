$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'advent_of_code/day_eighteen'

data = File.read('day_eighteen_input.txt').chomp.split(/\n/)

duet = AdventOfCode::DayEighteen.new *data

puts "Part one: #{duet.recover}"
