$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'advent_of_code/day_twenty_three'

rules = File.read('day_twenty_three_input.txt').chomp.split(/\n/)

coprocessor = AdventOfCode::DayTwentyThree.new *rules

coprocessor.run

puts "Part one: #{coprocessor.mul_count}"
