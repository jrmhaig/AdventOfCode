$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'advent_of_code/day_seven'

data = File.read('day_seven_input.txt').chomp.split(/\n/)

tree = AdventOfCode::DaySeven.new *data
puts "Part one: #{tree.base}"
puts "Part two: #{tree.find_error(tree.base)}"
