$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'advent_of_code/day_three'

puts "Part one: #{AdventOfCode::DayThree.manhattan 289326}"
