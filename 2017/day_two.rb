$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'advent_of_code/day_two'

sheet = File.read('day_two_input.txt').split(/\n/)

puts "Part one: #{AdventOfCode::DayTwo.checksum(sheet)}"
#puts "Part two: #{AdventOfCode::DayOne.captcha2(code)}"
