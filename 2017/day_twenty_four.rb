$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'advent_of_code/day_twenty_four'

pairs = File.read('day_twenty_four_input.txt').chomp.split(/\n/)

bridges = AdventOfCode::DayTwentyFour.new *pairs

puts "Part one: #{bridges.strongest}"
puts "Part two: #{bridges.strongest :longest}"
