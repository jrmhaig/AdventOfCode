$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'advent_of_code/day_ten'

data = File.read('day_ten_input.txt').chomp

code = AdventOfCode::DayTen.new size: 256, inputs: data, type: :simple
puts "Part one: #{code.checksum}"

data = File.read('day_ten_input.txt').chomp

code = AdventOfCode::DayTen.new size: 256, inputs: data, rounds: 64
puts "Part two: #{code.dense}"
