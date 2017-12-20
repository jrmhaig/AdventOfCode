$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'advent_of_code/day_twenty'

data = File.read('day_twenty_input.txt').chomp.split(/\n/)

system = AdventOfCode::DayTwenty.new *data
puts "Part one: #{system.find_closest}"
