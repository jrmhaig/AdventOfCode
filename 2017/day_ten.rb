$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'advent_of_code/day_ten'

data = File.read('day_ten_input.txt').split(/,/).map(&:to_i)

code = AdventOfCode::DayTen.new 256, data
puts "Part one: #{code.checksum}"

data = File.read('day_ten_input.txt').chomp.split(//).map(&:ord) + [17, 31, 73, 47, 23]

code = AdventOfCode::DayTen.new 256, data, 64
puts "Part two: #{code.dense}"
