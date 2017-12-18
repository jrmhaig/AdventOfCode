$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'advent_of_code/day_eighteen'

data = File.read('day_eighteen_input.txt').chomp.split(/\n/)

duet = AdventOfCode::DayEighteen.new *data
duet.method = :simple
puts "Part one: #{duet.recover}"

duet = AdventOfCode::DayEighteen.new *data
duet.method = :complex
duet.run
puts "Part one: #{duet.counts[1]}"
