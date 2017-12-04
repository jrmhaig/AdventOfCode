$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'advent_of_code/day_four'

passwords = File.read('day_four_input.txt').split(/\n/)

valid = passwords.select { |p| AdventOfCode::DayFour.validate(p) }

puts "Part one: #{valid.count}"
