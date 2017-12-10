$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'advent_of_code/day_ten'

data = File.read('day_ten_input.txt').split(/,/).map(&:to_i)

code = AdventOfCode::DayTen.new 256, data
puts "Part one: #{code.checksum}"
